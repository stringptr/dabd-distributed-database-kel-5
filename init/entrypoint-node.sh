#!/bin/bash
# =============================================================================
# Entry point universal node (primary perdana MAUPUN standby/rejoin).
# Dipakai oleh:
#   - stack utama (compose.yml root) untuk node primary -> auto-rejoin
#   - harness uji haproxy/test/compose.yml untuk SEMUA node
#
# Env:
#   PEERS      = daftar hostname semua node dalam shard yang sama (termasuk diri)
#   NODE_NAME  = nama container node ini
#   BOOTSTRAP  = initdb     -> node primary perdana (data kosong -> initdb + seed)
#                basebackup -> node standby (data kosong -> pg_basebackup dari primary)
#
# Perilaku saat start:
#   1. Data kosong  -> ikut BOOTSTRAP (initdb atau basebackup dari primary aktif)
#   2. Data ada + standby.signal ada -> start sebagai standby (streaming seperti biasa)
#   3. Data ada + TANPA standby.signal (peran primary) ->
#      cek peer: kalau ada node lain yang kini PRIMARY -> wipe + basebackup (rejoin);
#      kalau tidak ada -> tetap PRIMARY (restart normal).
# =============================================================================
set -e

: "${PGDATA:=/var/lib/postgresql/18/docker}"
: "${PEERS:?Env PEERS wajib diisi (hostname2 node dalam satu shard)}"
: "${NODE_NAME:?Env NODE_NAME wajib diisi}"
: "${BOOTSTRAP:=basebackup}"

CHECK_USER="${CHECK_USER:-haproxy}"
CHECK_PASSWORD="${CHECK_PASSWORD:-haproxy}"
STANDBY_USER="${STANDBY_USER:-standby}"
STANDBY_PASSWORD="${STANDBY_PASSWORD:-standby}"

log() { echo "[entrypoint $NODE_NAME] $*"; }

# Cek peran peer via SQL: 'f' = primary, 't' = standby, kosong = tidak terjangkau
peer_role() {
  PGPASSWORD="$CHECK_PASSWORD" psql \
    -h "$1" -p 5432 -U "$CHECK_USER" -d postgres \
    -tAc "SELECT pg_is_in_recovery()" 2>/dev/null | tr -d '[:space:]'
}

find_primary() {
  for peer in $PEERS; do
    [ "$peer" = "$NODE_NAME" ] && continue
    for _ in $(seq 1 30); do
      role="$(peer_role "$peer")"
      if [ "$role" = "f" ]; then
        echo "$peer"
        return 0
      fi
      sleep 2
    done
  done
  return 1
}

run_basebackup() {
  local primary="$1"
  log "pg_basebackup dari $primary ..."
  rm -rf "$PGDATA"/*
  mkdir -p "$PGDATA"
  chown -R postgres:postgres "$PGDATA"
  # Tanpa -R: postgresql.auto.conf hasil salinan sumber dibersihkan dulu di
  # bawah, lalu conninfo segar ditulis sendiri (hindari conninfo basi yang
  # menunjuk node lama / slot yang sudah tidak ada).
  PGPASSWORD="$STANDBY_PASSWORD" gosu postgres pg_basebackup \
    -h "$primary" -U "$STANDBY_USER" -D "$PGDATA" -Fp -Xs -P

  sed -i '/^primary_conninfo/d;/^primary_slot_name/d' "$PGDATA/postgresql.auto.conf"

  # Slot replikasi fisik di primary baru (idempoten) — streaming memakai slot
  # ini, sejalan dengan desain stack utama (slot persisten "standby1").
  local slot
  slot="$(PGPASSWORD="$STANDBY_PASSWORD" psql -h "$primary" -p 5432 -U "$STANDBY_USER" \
    -d postgres -tAc "SELECT count(*) FROM pg_replication_slots WHERE slot_name='standby1'" \
    2>/dev/null || echo 0)"
  if [ "$slot" = "0" ]; then
    PGPASSWORD="$STANDBY_PASSWORD" psql -h "$primary" -p 5432 -U "$STANDBY_USER" \
      -d postgres -c "SELECT pg_create_physical_replication_slot('standby1')" >/dev/null
    log "replication slot 'standby1' dibuat di $primary"
  fi

  {
    echo "primary_conninfo = 'host=$primary port=5432 user=$STANDBY_USER password=$STANDBY_PASSWORD application_name=$NODE_NAME'"
    echo "primary_slot_name = 'standby1'"
  } >>"$PGDATA/postgresql.auto.conf"
  touch "$PGDATA/standby.signal"
  chown postgres:postgres "$PGDATA/postgresql.auto.conf" "$PGDATA/standby.signal"
  log "Basebackup selesai — node siap sebagai standby."
}

if [ ! -s "$PGDATA/PG_VERSION" ]; then
  # ---- Boot perdana (data kosong) ----
  if [ "$BOOTSTRAP" = "initdb" ]; then
    log "Bootstrap perdana: initdb + seed (node primary)."
    exec /usr/local/bin/docker-entrypoint.sh "$@"
  fi
  primary="$(find_primary)" || { log "ERROR: primary shard tidak ditemukan."; exit 1; }
  run_basebackup "$primary"
elif [ ! -f "$PGDATA/standby.signal" ]; then
  # ---- Data ada, node merasa PRIMARY: mungkin bekas primary yang sudah tergantikan ----
  other=""
  for peer in $PEERS; do
    [ "$peer" = "$NODE_NAME" ] && continue
    role="$(peer_role "$peer")"
    if [ "$role" = "f" ]; then
      other="$peer"
      break
    fi
  done
  if [ -n "$other" ]; then
    log "Primary lain terdeteksi ($other) → rejoin sebagai standby (wipe + basebackup)."
    run_basebackup "$other"
  else
    log "Tidak ada primary lain → start sebagai primary."
  fi
else
  log "Standby terdeteksi → start sebagai standby."
fi

exec /usr/local/bin/docker-entrypoint.sh "$@"
