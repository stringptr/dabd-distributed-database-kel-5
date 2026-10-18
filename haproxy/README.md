# HAProxy — Routing Read/Write Distributed RDBMS

Bagian HAProxy dari tugas DABD: **routing tulis/baca + failover switching** untuk
arsitektur distributed RDBMS 2 shard (master-slave per shard).

## Cara kerja

```
Client
  ├─ tulis shard-1 → :5432 ┐
  ├─ tulis shard-2 → :5433 ├─► HAProxy ── health check SQL per node:
  ├─ baca shard-1 → :6432 │     pg_is_in_recovery() = 'f' → layani TULIS
  └─ baca shard-2 → :6433 ┘     pg_is_in_recovery() = 't' → layani BACA
  stats dashboard → :8404
```

- **Health check tool-agnostic** (`check_primary.sh` / `check_replica.sh`):
  HAProxy mengecek peran tiap node via `SELECT pg_is_in_recovery()` — bukan lewat
  API tool HA tertentu. Berlaku untuk Patroni, pg_auto_failover, maupun promote
  manual. Varian Patroni (`httpchk GET /primary` / `/replica`) tersedia sebagai
  komentar di `haproxy.cfg`.
- Saat primary mati → check gagal → HAProxy mematikan server itu (`fall 3` ≈ 6 dtk)
  dan memindahkan tulis ke node lain yang sedang primary (hasil promote).
- `resolvers docker` membuat HAProxy re-resolve IP container via DNS Docker, jadi
  container di-recreate tidak bikin routing nyangkut.

## Port

| Port  | Fungsi                                   |
|-------|------------------------------------------|
| 5432  | tulis shard-1 (hanya primary aktif)      |
| 5433  | tulis shard-2 (hanya primary aktif)      |
| 6432  | baca shard-1 (hanya standby, round-robin)|
| 6433  | baca shard-2 (hanya standby, round-robin)|
| 8404  | stats dashboard (HTTP)                   |

## Menjalankan harness uji

Harness di `test/` berisi 2 shard (primary+standby) Postgres asli + HAProxy —
untuk memperlihatkan perilaku routing & failover **tanpa** menunggu stack utama tim.

```bash
docker compose -f haproxy/test/compose.yml up -d --build
```

> **PENTING:** port harness sama dengan stack utama (5432/5433/6432/6433/8404) —
> jangan jalankan keduanya bersamaan. Reset penuh: `docker compose -f haproxy/test/compose.yml down -v`.

### Demo 1 — read/write split

```bash
# tulis hanya masuk primary (pg_is_in_recovery() = false)
docker exec -e PGPASSWORD=haproxy pg-shard2-1 psql -h haproxy -p 5432 -U haproxy -d postgres \
  -c "INSERT INTO demo (shard_note) VALUES ('via write port')"

# baca dilayani standby (true), datanya sudah tereplikasi
docker exec -e PGPASSWORD=haproxy pg-shard2-1 psql -h haproxy -p 6432 -U haproxy -d postgres \
  -c "SELECT pg_is_in_recovery(), * FROM demo"
```

### Demo 2 — auto-switch saat primary mati

```bash
# 1. matikan primary shard-1
docker compose -f haproxy/test/compose.yml stop pg-shard1-1

# 2. promote standby-nya menjadi primary baru
docker exec -e PGPASSWORD=haproxy pg-shard1-2 psql -U haproxy -d postgres \
  -c "SELECT pg_promote(true, 5)"

# 3. tunggu ~10 dtk (health check), tulis via :5432 sekarang dilayani node baru
docker exec -e PGPASSWORD=haproxy pg-shard2-1 psql -h haproxy -p 5432 -U haproxy -d postgres \
  -c "INSERT INTO demo (shard_note) VALUES ('sesudah failover')"

# buktikan dari node mana yang melayani:
docker exec -e PGPASSWORD=haproxy pg-shard2-1 psql -h haproxy -p 5432 -U haproxy -d postgres \
  -c "SELECT inet_server_addr()"
```

### Demo 3 — rejoin node lama

```bash
# primary lama otomatis wipe + pg_basebackup → kembali sebagai standby
docker compose -f haproxy/test/compose.yml start pg-shard1-1
docker exec -e PGPASSWORD=haproxy pg-shard1-1 psql -U haproxy -d postgres \
  -c "SELECT pg_is_in_recovery()"   # true = sudah standby lagi
```

Perilaku rejoin diatur `test/entrypoint-node.sh`: node yang punya data tapi tidak
punya `standby.signal` akan mengecek peer — kalau ada primary lain, ia wipe diri
dan basebackup ulang dari primary tersebut.

## Kontrak untuk integrasi dengan stack utama tim

Agar `haproxy.cfg` bisa dipakai langsung di compose utama, tim harus menyediakan:

1. **Hostname service** (atau ubah baris `# >>> SESUAIKAN` di `haproxy.cfg`):
   `pg-shard1-1`, `pg-shard1-2`, `pg-shard2-1`, `pg-shard2-2` — atau ganti dengan
   nama service apapun di backend (2 baris per backend).
2. **Port Postgres** backend: 5432 (sesuaikan di baris `server` bila berbeda).
3. **Role login untuk health check** — default `haproxy` / password `haproxy`
   (di `check_primary.sh` & `check_replica.sh`). Cukup satu role dengan `LOGIN`
   (tidak perlu superuser; `pg_is_in_recovery()` bisa dipanggil role biasa).
4. HAProxy dan semua node Postgres **satu Docker network**.
5. Kalau tim memakai **Patroni**: tidak perlu role di poin 3 — ganti ke varian
   `httpchk` (komentar di bawah `haproxy.cfg`).

Contoh tambah service HAProxy di compose utama tim:

```yaml
  haproxy:
    build: ./haproxy          # atau image hasil build: dabd-haproxy:local
    container_name: haproxy
    restart: unless-stopped
    depends_on: [postgres-primary-1, postgres-primary-2]   # + node standby bila ada
    ports:
      - "5432:5432"
      - "5433:5433"
      - "6432:6432"
      - "6433:6433"
      - "8404:8404"
    volumes:
      - ./haproxy/haproxy.cfg:/usr/local/etc/haproxy/haproxy.cfg:ro
    networks: [pg-network]
```

## Struktur

```
haproxy/
├── haproxy.cfg         # config utama (4 frontend + stats + varian Patroni)
├── Dockerfile          # haproxy:3.1-alpine + postgresql17-client (untuk external-check)
├── check_primary.sh    # health check: pg_is_in_recovery() = 'f'  → boleh tulis
├── check_replica.sh    # health check: pg_is_in_recovery() = 't'  → boleh baca
└── test/
    ├── compose.yml     # harness: 2 shard (primary+standby) + haproxy
    ├── entrypoint-node.sh  # bootstrap/rejoin node (initdb | basebackup | rejoin)
    └── init-primary.sh     # seed primary perdana (role haproxy/standby + tabel demo)
```
