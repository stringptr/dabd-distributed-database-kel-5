#!/bin/sh
# =============================================================================
# Health check HAProxy: server dianggap SEHAT untuk backend BACA (read)
# bila koneksi SQL berhasil dan node tersebut sedang STANDBY/REPLIKA
# (pg_is_in_recovery() = 't').
#
# Dijalankan HAProxy dengan argumen: $1=proxy_addr $2=proxy_port
#                                        $3=server_addr $4=server_port
# Kredensial: role login "haproxy" (superuser di harness) — sesuaikan bila
# berbeda pada stack asli tim (lihat README, bagian Kontrak).
# =============================================================================
export PGPASSWORD="haproxy"

/usr/bin/psql -h "$3" -p "$4" -U haproxy -d postgres \
  -tAc "SELECT pg_is_in_recovery()" 2>/dev/null | grep -q '^t$'
