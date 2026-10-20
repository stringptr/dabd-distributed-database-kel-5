#!/bin/bash
# =============================================================================
# Watchdog auto-failover per shard.
#
# Memantau primary shard; bila primary tidak terjangkau selama FAIL_THRESHOLD
# kali berturut-turut (masing-masing CHECK_INTERVAL detik, dengan
# connect_timeout), watchdog mempromosikan standby shard tersebut via
# pg_promote(). Setelah promosi, HAProxy (check_primary.sh/check_replica.sh)
# otomatis memindahkan traffic tulis ke node baru.
#
# Env (wajib):
#   PRIMARY_HOST   = hostname primary shard ini
#   STANDBY_HOST   = hostname standby shard ini
# Opsional:
#   PGUSER / PGPASSWORD     = kredensial superuser watchdog (default watchdog)
#   CHECK_INTERVAL          = detik antar cek (default 3)
#   FAIL_THRESHOLD          = jumlah gagal berturut sebelum promosi (default 5)
#   CONNECT_TIMEOUT         = detik timeout koneksi TCP libpq (default 3)
#
# State machine (per container watchdog):
#   NORMAL  -> cek primary; 'f' = sehat, gagal berturut -> promote
#   PROMOTED-> promosi sudah dilakukan; hanya log peringatan bila primary lama
#              bangun lagi ('f') sementara proses rejoin berjalan
#
# Keterbatasan (didokumentasikan di README):
#   - Replication async: data WAL beberapa detik terakhir bisa hilang saat
#     promosi terjadi sebelum replay lengkap.
#   - Tanpa fencing/STONITH: bila primary hidup tapi terisolasi dari watchdog,
#     bisa terjadi dual-primary sampai primary lama di-rejoin.
# =============================================================================
set -u

: "${PRIMARY_HOST:?Env PRIMARY_HOST wajib diisi}"
: "${STANDBY_HOST:?Env STANDBY_HOST wajib diisi}"
export PGUSER="${PGUSER:-watchdog}"
export PGPASSWORD="${PGPASSWORD:-watchdog}"
export PGCONNECT_TIMEOUT="${CONNECT_TIMEOUT:-3}"   # param libpq (bukan GUC server)
CHECK_INTERVAL="${CHECK_INTERVAL:-3}"
FAIL_THRESHOLD="${FAIL_THRESHOLD:-5}"
PGDATABASE="${PGDATABASE:-postgres}"

log() { echo "[watchdog $PRIMARY_HOST] $(date '+%Y-%m-%d %H:%M:%S') $*"; }

# Cek peran node: 'f' = primary, 't' = standby, kosong = tidak terjangkau.
node_role() {
  psql -h "$1" -p 5432 -d "$PGDATABASE" \
    -tAc "SELECT pg_is_in_recovery()" 2>/dev/null | tr -d '[:space:]'
}

fail_count=0
state="NORMAL"
log "memulai monitoring: primary=$PRIMARY_HOST standby=$STANDBY_HOST interval=${CHECK_INTERVAL}s threshold=$FAIL_THRESHOLD"

while true; do
  role="$(node_role "$PRIMARY_HOST")"

  case "$state:$role" in
    NORMAL:f)
      if [ "$fail_count" -gt 0 ]; then
        log "primary kembali terjangkau — reset penghitung kegagalan"
      fi
      fail_count=0
      ;;

    NORMAL:t)
      log "PERINGATAN: $PRIMARY_HOST menjawab sebagai standby ('t') — shard mungkin sedang dipimpin node lain (promosi manual / failover berjalan)"
      fail_count=0
      ;;

    NORMAL:)
      fail_count=$((fail_count + 1))
      log "KEGAGALAN $fail_count/$FAIL_THRESHOLD: $PRIMARY_HOST tidak terjangkau"
      if [ "$fail_count" -ge "$FAIL_THRESHOLD" ]; then
        standby_role="$(node_role "$STANDBY_HOST")"
        if [ "$standby_role" = "t" ]; then
          log "mempromosikan $STANDBY_HOST menjadi primary baru (pg_promote)..."
          if psql -h "$STANDBY_HOST" -p 5432 -d "$PGDATABASE" \
              -c "SELECT pg_promote(true, 5)" >/dev/null 2>&1; then
            state="PROMOTED"
            fail_count=0
            log "FAILOVER SELESAI: $STANDBY_HOST kini primary baru. HAProxy akan memindahkan tulis dalam ~6 detik."
          else
            log "ERROR: pg_promote ke $STANDBY_HOST gagal — coba lagi pada siklus berikutnya"
            fail_count=0
          fi
        else
          log "ERROR: standby $STANDBY_HOST tidak berperan standby (role='$standby_role') — TIDAK mempromosikan"
          fail_count=0
        fi
      fi
      ;;

    PROMOTED:f)
      log "PERINGATAN: $PRIMARY_HOST bangun lagi sebagai PRIMARY ('f') — risiko dual-primary; biarkan entrypoint node melakukan rejoin (wipe + basebackup)"
      ;;

    PROMOTED:t|PROMOTED:)
      # Node lama sudah standby lagi (rejoin selesai) atau masih mati — state sehat.
      ;;
  esac

  sleep "$CHECK_INTERVAL"
done
