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

## Integrasi dengan stack utama tim (sudah terpasang)

Integrasi sudah aktif di `compose.yml` root:

- **Config khusus stack tim**: `haproxy/haproxy-main.cfg` (menunjuk
  `postgres-primary-1/2` + `postgres-primary-1/2-standby-1`). Config harness
  (`haproxy.cfg`) tetap dipakai `test/compose.yml` dan tidak berubah.
- **Role health check**: `init/haproxy_user.sql` membuat role login `haproxy`
  (dipakai `check_primary.sh`/`check_replica.sh`; cukup LOGIN biasa,
  `pg_is_in_recovery()` bisa dipanggil role biasa).
- **Service `haproxy`** di compose root, satu network `pg-network`.
  Karena port host 5432/5433 dipakai primary, mapping host-nya:
  | Fungsi | Port di jaringan docker | Port host |
  |--------|-------------------------|-----------|
  | tulis shard-1 | `haproxy:5432` | **6532** |
  | tulis shard-2 | `haproxy:5433` | **6533** |
  | baca shard-1 | `haproxy:6432` | **6632** |
  | baca shard-2 | `haproxy:6433` | **6633** |
  | stats | `haproxy:8404` | **8404** |
- Aplikasi di dalam docker cukup konek `haproxy:5432` (tulis) / `haproxy:6432`
  (baca) dengan kredensial aplikasi biasa (`primary`/`standby`).

Kalau tim memakai **Patroni**: role `haproxy` tidak diperlukan — ganti ke varian
`httpchk` (komentar di bawah `haproxy.cfg`).

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
