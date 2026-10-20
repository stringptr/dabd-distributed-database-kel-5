#!/bin/bash
# =============================================================================
# Demo auto-failover stack utama (jalankan dari folder repo, butuh docker +
# bash: Git Bash / WSL / Linux). Menghasilkan log bertimestamp sebagai bukti.
#
# Langkah yang dilakukan:
#   1. Baseline  : tulis via HAProxy :6532 dilayani postgres-primary-1
#   2. Kill      : stop primary shard-1 (simulasi crash)
#   3. Failover  : watchdog-1 otomatis pg_promote() standby (~15 detik)
#   4. Verifikasi: tulis via :6532 kini dilayani node standby-1 (primary baru)
#   5. Rejoin    : start primary lama -> entrypoint wipe+basebackup -> standby
#
# Reset penuh setelah demo (bind-mount TIDAK ikut terhapus oleh down -v):
#   docker compose down -v
#   rm -rf primary_data_* primary_*_replica_*_data   # bash; PowerShell: Remove-Item -Recurse primary_data_*, primary_*_replica_*_data
#   docker compose up -d --build
# =============================================================================
set -euo pipefail

WPORT=6532                       # port tulis shard-1 via HAProxy
PSQL_HAPROXY="docker exec -i -e PGPASSWORD=primary haproxy psql -h haproxy -p 5432 -U primary -d postgres"
PSQL_STANDBY="docker exec -i -e PGPASSWORD=standby postgres-primary-1-standby-1 psql -U standby -d postgres"
PSQL_OLD_PRIMARY="docker exec -i -e PGPASSWORD=primary postgres-primary-1 psql -U primary -d postgres"

step() { echo; echo "===== [$(date '+%H:%M:%S')] $* ====="; }

step "STEP 0 — pastikan stack berjalan"
if [ "$(docker inspect -f '{{.State.Running}}' haproxy 2>/dev/null)" != "true" ]; then
  echo "ERROR: container 'haproxy' tidak berjalan. Jalankan dulu: docker compose up -d --build"
  exit 1
fi

step "STEP 1 — baseline: tulis via HAProxy :6532 (host port $WPORT)"
docker exec -i -e PGPASSWORD=primary haproxy \
  psql -h haproxy -p 5432 -U primary -d postgres \
  -c "CREATE TABLE IF NOT EXISTS failover_demo (note text, ts timestamptz default now())"
docker exec -i -e PGPASSWORD=primary haproxy \
  psql -h haproxy -p 5432 -U primary -d postgres \
  -c "INSERT INTO failover_demo (note) VALUES ('sebelum failover')"
echo "Node yang melayani tulis:"
$PSQL_HAPROXY -tAc "SELECT inet_server_addr() FROM failover_demo WHERE note='sebelum failover'"

step "STEP 2 — simulasi crash: stop postgres-primary-1"
docker compose stop postgres-primary-1
echo "Menunggu watchdog-1 mempromosikan standby (threshold 5 x 3 dtk + promosi)..."
for _ in $(seq 1 40); do
  role="$($PSQL_STANDBY -tAc 'SELECT pg_is_in_recovery()' 2>/dev/null || true)"
  if [ "$role" = "f" ]; then
    echo "Standby sudah menjadi PRIMARY pada $(date '+%H:%M:%S')"
    break
  fi
  sleep 3
done
role="$($PSQL_STANDBY -tAc 'SELECT pg_is_in_recovery()' 2>/dev/null || true)"
if [ "$role" != "f" ]; then
  echo "ERROR: standby belum ter-promote. Log watchdog-1:"
  docker compose logs --tail 30 watchdog-1
  exit 1
fi
echo "Log watchdog-1 (promosi):"
docker compose logs --tail 10 watchdog-1

step "STEP 3 — tulis via HAProxy lagi (tunggu health check HAProxy ~8 dtk)"
sleep 10
$PSQL_HAPROXY -c "INSERT INTO failover_demo (note) VALUES ('sesudah failover')"
echo "Node yang melayani tulis SESUDAH failover:"
$PSQL_HAPROXY -tAc "SELECT inet_server_addr() FROM failover_demo WHERE note='sesudah failover'"
echo "Peran kedua node shard-1:"
echo "  postgres-primary-1-standby-1 (via 5442 host): $($PSQL_STANDBY -tAc 'SELECT pg_is_in_recovery()')"

step "STEP 4 — rejoin node lama: start postgres-primary-1"
docker compose start postgres-primary-1
echo "Menunggu rejoin (wipe + pg_basebackup)..."
for _ in $(seq 1 60); do
  r="$($PSQL_OLD_PRIMARY -tAc 'SELECT pg_is_in_recovery()' 2>/dev/null || true)"
  if [ "$r" = "t" ]; then
    echo "Primary lama kini STANDBY (rejoin selesai) pada $(date '+%H:%M:%S')"
    break
  fi
  sleep 3
done
r="$($PSQL_OLD_PRIMARY -tAc 'SELECT pg_is_in_recovery()' 2>/dev/null || true)"
echo "  postgres-primary-1 (via 5432 host) pg_is_in_recovery() = '$r'  (harus 't')"
echo "Data pasca-failover terbaca di node yang rejoined:"
$PSQL_OLD_PRIMARY -tAc "SELECT count(*) || ' baris failover_demo terlihat' FROM failover_demo"

step "DEMO SELESAI — shard-2 tidak terganggu"
docker compose ps --format "table {{.Name}}\t{{.Status}}"
