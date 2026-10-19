#!/bin/bash
# =============================================================================
# Seed node primary perdana (dijalankan docker-entrypoint saat initdb pertama).
# Membuat:
#   - role "haproxy"  : login superuser untuk health check HAProxy & demo client
#   - role "standby"  : role replikasi untuk pg_basebackup node standby
#   - tabel "demo"    : tabel kecil untuk mendemokan routing tulis/baca
# Lalu menambahkan baris pg_hba agar koneksi replikasi diperbolehkan.
# =============================================================================
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<'EOSQL'
CREATE ROLE haproxy LOGIN SUPERUSER PASSWORD 'haproxy';
CREATE ROLE standby WITH REPLICATION LOGIN PASSWORD 'standby';

CREATE TABLE demo (
    id         SERIAL PRIMARY KEY,
    shard_note TEXT,
    written_by TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
EOSQL

echo "host replication all all scram-sha-256" >>"$PGDATA/pg_hba.conf"

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" \
  -c "SELECT pg_reload_conf();"

echo "Node primary perdana selesai di-seed."
