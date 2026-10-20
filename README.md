# Distributed E-Commerce Database System (Kelompok 5)

Proyek sistem basis data relasional terdistribusi untuk mata kuliah **Desain Aplikasi Big Data (DABD)**.

---

## Arsitektur Sistem

Arsitektur terdiri dari **2 Shard**, di mana setiap shard memiliki arsitektur **Master-Slave (Primary-Standby Replication)**:

```
                          ┌─────────────────────────────┐
                          │   Distributed RDBMS Client  │
                          └──────────────┬──────────────┘
                                         │
                 ┌───────────────────────┴───────────────────────┐
                 │                                               │
                 ▼                                               ▼
      ┌─────────────────────┐                         ┌─────────────────────┐
      │       SHARD 1       │ ◄───── postgres_fdw ──► │       SHARD 2       │
      │  (Customer ID 1-75) │   (Cross-Shard Query)   │(Customer 1001-1075) │
      │  (Order ID 1-100)   │                         │ (Order 1001-1100)   │
      └──────────┬──────────┘                         └──────────┬──────────┘
                 │                                               │
     Streaming WAL Replikasi                         Streaming WAL Replikasi
                 │                                               │
                 ▼                                               ▼
      ┌─────────────────────┐                         ┌─────────────────────┐
      │   SHARD 1 STANDBY   │                         │   SHARD 2 STANDBY   │
      │   (Port 5442, RO)   │                         │   (Port 5443, RO)   │
      └─────────────────────┘                         └─────────────────────┘
```

### Port Mapping Node Basis Data

| Node Container | Peran | Port Host | Dataset Utama |
|---|---|---|---|
| `postgres-primary-1` | Primary Shard 1 (Master) | `5432` | Customers 1–75 (Band 1..1000), Orders 1–100 (Band 1..1000), FDW ke Shard 2 |
| `postgres-primary-1-standby-1` | Standby Shard 1 (Slave/Replica) | `5442` | Read-only replica dari Shard 1 |
| `postgres-primary-2` | Primary Shard 2 (Master) | `5433` | Customers 1001–1075 (Band 1001..2000), Orders 1001–1100 (Band 1001..2000), FDW ke Shard 1 |
| `postgres-primary-2-standby-1` | Standby Shard 2 (Slave/Replica) | `5443` | Read-only replica dari Shard 2 |

---

## Implementasi Tugas 2: Partitioning, Sharding, dan Replikasi

### 1. Table Partitioning (Declarative Partitioning)
Diimplementasikan secara native pada PostgreSQL 18 di dalam [init/ddl.sql](init/ddl.sql) menggunakan 3 metode partisi:

1. **Hash Partitioning** pada tabel `Orders`:
   - Kunci partisi: `order_id`
   - Jumlah partisi: 2 (`orders_p0` untuk modulus 2 remainder 0, `orders_p1` untuk remainder 1).
   - **Koreksi Teknis**: PostgreSQL tidak menggunakan modulo integer langsung (`order_id % 2`), melainkan fungsi hash internal 32-bit (`hash_record`). Pemeriksaan partisi fisik yang ditempati baris dibuktikan secara pasti menggunakan atribut sistem `tableoid::regclass`.
   - Mengaktifkan **Partition Pruning** otomatis saat query dengan filter `order_id`.
2. **List Partitioning** pada tabel `Payments`:
   - Kunci partisi: `status`
   - Partisi: `payments_completed` ('Completed'), `payments_pending` ('Pending'), `payments_failed` ('Failed').
   - Dilengkapi trigger bisnis `check_payment_order_unique` untuk menjamin integritas relasi 1 Order = 1 Payment lintas partisi.
3. **Range Partitioning** pada tabel `Reviews`:
   - Kunci partisi: `rating`
   - Partisi: `reviews_low` (rating 1–2), `reviews_mid` (rating 3), `reviews_high` (rating 4–5).
   - Dilengkapi trigger bisnis `check_review_customer_product_unique` untuk menjamin 1 Customer hanya dapat mereview 1 Produk sekali.

### 2. Horizontal Sharding across Nodes
Data didistribusikan secara terpisah antara `postgres-primary-1` dan `postgres-primary-2`:

- **Replicated Tables (Lookup/Dimension Data)**:
  Tabel referensi berukuran kecil hingga menengah direplikasi identik di kedua shard agar operasi JOIN dapat dilakukan secara lokal dan efisien:
  - `Categories` (20 baris)
  - `Suppliers` (25 baris)
  - `Warehouses` (6 baris)
  - `Products` (250 baris)
  - `Coupons` (15 baris)
  - `Inventory` (1.500 baris)
- **Sharded Tables (Transactional / Entity Data)**:
  - **Shard 1 ([init/insert_data_shard1.sql](init/insert_data_shard1.sql))**:
    - `Customers`: ID 1 s.d. 75 (Alokasi band: 1..1000)
    - `Orders`: ID 1 s.d. 100 (Alokasi band: 1..1000)
    - `Order_Items`, `Payments`, `Shipments` untuk Orders 1–100
    - `Reviews` dari Customers 1–75
  - **Shard 2 ([init/insert_data_shard2.sql](init/insert_data_shard2.sql))**:
    - `Customers`: ID 1001 s.d. 1075 (Alokasi band: 1001..2000)
    - `Orders`: ID 1001 s.d. 1100 (Alokasi band: 1001..2000)
    - `Order_Items`, `Payments`, `Shipments` untuk Orders 1001–1100
    - `Reviews` dari Customers 1001–1075
- **Boundary Constraints & Sequence Separation**:
  - Diterapkan melalui [init/shard_constraints_shard1.sql](init/shard_constraints_shard1.sql) dan [init/shard_constraints_shard2.sql](init/shard_constraints_shard2.sql).
  - Shard 1 dibatasi `CHECK (customer_id BETWEEN 1 AND 1000)`, sequence restart 76 maxvalue 1000.
  - Shard 2 dibatasi `CHECK (customer_id BETWEEN 1001 AND 2000)`, sequence restart 1076 maxvalue 2000.
  - Menjamin operasi `INSERT` baru pada Shard 1 tidak akan pernah menghasilkan ID yang bertabrakan (*collision-free*) dengan Shard 2.
- **Cross-Shard Querying via `postgres_fdw`**:
  Dikonfigurasi di [init/fdw_shard1.sql](init/fdw_shard1.sql) dan [init/fdw_shard2.sql](init/fdw_shard2.sql):
  - Menggunakan user mapping berkuotasi (`FOR "primary"`).
  - Menyediakan 6 Foreign Tables (`customers`, `orders`, `order_items`, `payments`, `shipments`, `reviews`) untuk mengakses shard pasangan.
  - Menyediakan 6 Distributed Views (`v_distributed_*`) yang menyatukan seluruh dataset cluster (150 customer, 200 order) secara transparan.

### 3. Replikasi Master-Slave
- Menggunakan PostgreSQL Physical Streaming Replication dengan Write-Ahead Logging (`wal_level=replica`).
- Replication slot persisten (`standby1`) mencegah WAL terhapus sebelum terbaca oleh Standby.
- Replikasi berjalan terpisah dan independen per shard:
  - Shard 1: `postgres-primary-1` ➔ `postgres-primary-1-standby-1`
  - Shard 2: `postgres-primary-2` ➔ `postgres-primary-2-standby-1`
- Node standby berstatus read-only (`pg_is_in_recovery() = true`), menolak transaksi penulisan, dan secara real-time mencerminkan data terpartisi dan tershard dari primary masing-masing.

---

## Implementasi Tugas 3: Auto Failover

Auto failover ditambahkan di atas arsitektur yang sudah ada (replikasi streaming + HAProxy) tanpa mengubah config HAProxy maupun skema database.

### Cara Kerja

```
Client ──tulis──▶ HAProxy :6532/:6533 ──▶ Primary shard
                     │                        │ crash
                     │ health check            ▼
                     │ pg_is_in_recovery()  watchdog-1/2 mendeteksi primary
                     │ (sudah ada)           tidak terjangkau 5× berturut (±26 dtk)
                     │                        ▼
                     │◀── role berubah ── pg_promote() standby shard
                     ▼                        │
              traffic tulis pindah        standby = primary baru
              ke node baru (~6 dtk)
```

1. **Watchdog per shard** (`failover/watchdog.sh`, service `watchdog-1`/`watchdog-2` di `compose.yml`):
   - Memanggil `SELECT pg_is_in_recovery()` ke primary shard tiap 3 detik (`CHECK_INTERVAL`) dengan role superuser `watchdog` (`init/watchdog_user.sql`).
   - Jika primary tidak terjangkau 5 kali berturut (`FAIL_THRESHOLD`; terukur ±26 dtk karena koneksi ke IP container mati menunggu timeout), watchdog memastikan standby masih berperan standby lalu menjalankan `SELECT pg_promote(true, 5)`.
   - Setelah promosi, watchdog masuk state `PROMOTED` (final) dan hanya mencatat peringatan bila primary lama hidup kembali.
2. **Routing otomatis oleh HAProxy** (komponen Tugas 4, sudah ada): health check `check_primary.sh`/`check_replica.sh` mendeteksi peran baru dalam ≤8 detik (`inter 2s`, `rise 2`/`fall 3`) — traffic tulis pindah tanpa edit config.
3. **Auto-rejoin primary lama**: node primary memakai `init/entrypoint-node.sh` (diadaptasi dari harness uji `haproxy/test/`). Saat container primary lama dihidupkan setelah kalah failover, entrypoint mendeteksi ada node lain yang kini primary, lalu **wipe data diri + `pg_basebackup` dari primary baru** — kembali sebagai standby secara otomatis. Tidak perlu reset `down -v` untuk memulihkan keadaan normal.

### Demo Auto-Failover

Otomatis (butuh bash: Git Bash/WSL/Linux):
```bash
docker compose up -d --build
bash failover/demo_failover.sh
```

Manual — langkah dan bukti yang diharapkan:
```bash
# 1. Baseline: tulis shard-1 dilayani primary
docker exec -i -e PGPASSWORD=primary haproxy psql -h haproxy -p 5432 -U primary -d postgres \
  -c "SELECT inet_server_addr()"
#    -> 172.x.x.2 (postgres-primary-1)

# 2. Simulasi crash primary shard-1
docker compose stop postgres-primary-1

# 3. Tunggu watchdog-1 mempromosikan standby (±30 detik total) — cek log:
docker compose logs -f watchdog-1
#    -> "[watchdog postgres-primary-1] ... FAILOVER SELESAI: postgres-primary-1-standby-1 kini primary baru"

# 4. Tulis via HAProxy lagi (beri jeda ~8 dtk untuk health check)
docker exec -i -e PGPASSWORD=primary haproxy psql -h haproxy -p 5432 -U primary -d postgres \
  -c "SELECT inet_server_addr()"
#    -> 172.x.x.3 (postgres-primary-1-standby-1, primary baru)

# 5. Rejoin node lama (otomatis wipe + basebackup)
docker compose start postgres-primary-1
docker exec -i -e PGPASSWORD=primary postgres-primary-1 psql -U primary -d postgres \
  -c "SELECT pg_is_in_recovery()"   # -> true (sudah standby lagi)
```

**Urutan waktu failover (RTO, terukur pada pengujian nyata)**: deteksi watchdog ±26 dtk (5 × gagal, interval 3–6 dtk termasuk timeout DNS koneksi container yang sudah berhenti) + promosi ±4 dtk + HAProxy langsung pindah ≈ **±30 detik** dari primary mati sampai tulis dilayani node baru. Threshold bisa diturunkan lewat env `CHECK_INTERVAL`/`FAIL_THRESHOLD` di `compose.yml` (trade-off: lebih agresif = lebih rentan false positive).

### Hasil Eksekusi (Bukti Failover)

Diuji penuh pada 2026-10-20 dengan `bash failover/demo_failover.sh`. Log asli:

**1. Watchdog otomatis mempromosikan standby saat primary crash (tanpa intervensi manual):**

```
11:07:21  $ docker compose stop postgres-primary-1          # simulasi crash
11:07:21  [watchdog postgres-primary-1] KEGAGALAN 1/5: postgres-primary-1 tidak terjangkau
11:07:27  [watchdog postgres-primary-1] KEGAGALAN 2/5: postgres-primary-1 tidak terjangkau
11:07:35  [watchdog postgres-primary-1] KEGAGALAN 3/5: postgres-primary-1 tidak terjangkau
11:07:41  [watchdog postgres-primary-1] KEGAGALAN 4/5: postgres-primary-1 tidak terjangkau
11:07:47  [watchdog postgres-primary-1] KEGAGALAN 5/5: postgres-primary-1 tidak terjangkau
11:07:47  [watchdog postgres-primary-1] mempromosikan postgres-primary-1-standby-1 menjadi primary baru (pg_promote)...
11:07:51  [watchdog postgres-primary-1] FAILOVER SELESAI: postgres-primary-1-standby-1 kini primary baru.
          HAProxy akan memindahkan tulis dalam ~6 detik.
```

**2. Routing tulis HAProxy berpindah otomatis ke primary baru (tanpa edit config):**

```bash
# sebelum failover
docker exec -i -e PGPASSWORD=primary haproxy psql -h haproxy -p 5432 -U primary -d postgres \
  -tAc "SELECT inet_server_addr() FROM failover_demo WHERE note='sebelum failover'"
172.20.0.3        # = postgres-primary-1 (primary lama)

# sesudah failover (insert sukses via port yang sama)
172.20.0.4        # = postgres-primary-1-standby-1 (primary baru)
SELECT inet_server_addr() ... WHERE note='sesudah failover'
172.20.0.4

# peran node shard-1
postgres-primary-1-standby-1  pg_is_in_recovery() = f   # kini PRIMARY
```

**3. Auto-rejoin primary lama (wipe + pg_basebackup) — kembali sebagai standby:**

```
11:08:01  $ docker compose start postgres-primary-1
          [entrypoint postgres-primary-1] Primary lain terdeteksi (postgres-primary-1-standby-1)
          → rejoin sebagai standby (wipe + basebackup).
11:08:28  postgres-primary-1  pg_is_in_recovery() = t    # rejoin selesai (±27 dtk)
2 baris failover_demo terlihat                           # data pre+post failover terbaca
```

**4. Setelah rejoin — replikasi dari primary baru berjalan normal (slot aktif):**

```bash
# di postgres-primary-1-standby-1 (primary baru):
SELECT application_name, client_addr, state FROM pg_stat_replication;
 application_name  | client_addr |   state
-------------------+-------------+-----------
 postgres-primary-1 | 172.20.0.3 | streaming

SELECT slot_name, active FROM pg_replication_slots;
 standby1 | t

# port baca HAProxy pulih, dilayani node rejoined:
read ok, recovery=true server=172.20.0.3
# shard-2 tidak terganggu:
shard2 recovery=false, orders=100
```

Semua service kembali sehat (`docker compose ps`): 2 primary, 2 standby, HAProxy, 2 watchdog.

### Keterbatasan Auto Failover

1. **Replication async**: WAL belum tentu sudah ter-replay penuh di standby saat promosi — maksimal beberapa detik data terakhir bisa hilang.
2. **Tanpa fencing/STONITH**: watchdog hanya mendeteksi ketidakjangkauan dari sudut pandangnya. Jika primary hidup tetapi terisolasi jaringan (bukan crash), ada jendela dual-primary sampai primary lama bangun dan di-rejoin entrypoint. Sistem production memakai STONITH/fencing atau consensus (etcd/Patroni) untuk ini.
3. **Satu kali failover per watchdog**: setelah promosi, watchdog tidak lagi mempromosikan otomatis (shard hanya punya 2 node). Bila primary baru mati, kembalikan node via rejoin lalu restart watchdog (`docker compose restart watchdog-1`) atau reset penuh (lihat **Cara Menjalankan → Reset Penuh** — hapus juga direktori bind-mount data, `down -v` saja tidak cukup).
4. **Init script hanya jalan sekali**: role `watchdog` dibuat saat initdb perdana. Data lama (sebelum fitur ini) perlu reset penuh sekali (lihat di atas) untuk memicu init ulang.
5. **Port baca kosong saat window satu-node**: tepat setelah failover (sebelum rejoin selesai), shard hanya punya satu node hidup yang berperan primary — tidak ada server lulus health-check `check_replica.sh`, sehingga port baca shard-1 (`:6632`/`haproxy:6432`) menolak koneksi selama ±1 menit sampai node lama selesai rejoin. Pada window ini baca bisa dilayani lewat **port tulis** (`:6532`) karena primary juga menerima `SELECT`. Setelah rejoin, port baca pulih (dilayani node rejoined). Alternatif bila ingin port baca selalu tersedia: tambah node ketiga per shard, atau ubah health-check backend baca agar primary juga melayani baca (keputusan routing — Tugas 4).

---

## Batasan Sistem (Known Limitations)

Dalam arsitektur *shared-nothing distributed database* berbasis RDBMS mandiri:

1. **Unique Email Lintas Shard**:
   Constraint `email VARCHAR(100) UNIQUE` hanya ditegakkan secara lokal di masing-masing shard database engine. PostgreSQL tidak memiliki distributed unique constraint bawaan lintas instance jaringan tanpa bantuan *Distributed Transaction Coordinator* (seperti 2PC di CockroachDB/Google Spanner) atau pemeriksaan di layer aplikasi / API Gateway sebelum rute insert ditentukan.
2. **Sinkronisasi Tabel Replicated**:
   Tabel referensi (`categories`, `suppliers`, dll) diinisialisasi secara statis dari dataset yang sama. Pada lingkungan produksi nyata dengan pembaruan dinamis, sinkronisasi master-ke-semua-shard membutuhkan *Logical Replication (Publication/Subscription)* atau *Change Data Capture (CDC)* berbasis message broker (seperti Debezium + Apache Kafka).

---

## Cara Menjalankan

1. **Jalankan Docker Compose**:
   ```bash
   docker compose up -d
   ```

2. **Cek Status Kontainer**:
   ```bash
   docker compose ps
   ```
   Service `watchdog-1` dan `watchdog-2` (auto failover) berjalan sebagai proses latar yang selalu aktif — lognya: `docker compose logs -f watchdog-1`.

3. **(Opsional) Generate Ulang Dataset Shard**:
   ```bash
   python init/generate.py
   ```

4. **Reset Penuh (hapus semua data & init ulang dari nol)**:
   > Penting: direktori data adalah **bind-mount** (`primary_data_1/2`, `primary_1/2_replica_1_data`) —
   > `docker compose down -v` saja TIDAK menghapusnya, sehingga init script tidak akan jalan ulang.
   ```bash
   # PowerShell
   docker compose down -v; Remove-Item -Recurse -Force primary_data_*, primary_*_replica_*_data
   # atau bash (Git Bash/WSL)
   docker compose down -v && rm -rf primary_data_* primary_*_replica_*_data

   docker compose up -d --build
   ```

---

## Panduan Pengujian & Hasil Eksekusi (Review Tugas 2)

Folder [query/](query/) telah di-mount ke dalam kontainer di direktori `/query`. Anda dapat menjalankannya langsung via `docker exec`:

### A. Pembuktian Partitioning
Jalankan file [query/task2_partitioning_proof.sql](query/task2_partitioning_proof.sql):
```bash
docker exec -it postgres-primary-1 psql -U primary -d postgres -f /query/task2_partitioning_proof.sql
```

**Hasil Pengujian yang Ditampilkan**:
```text
               partitioned_table |    partition_name  | partition_bound
              -------------------+--------------------+-------------------------------------
               orders            | orders_p0          | FOR VALUES WITH (modulus 2, remainder 0)
               orders            | orders_p1          | FOR VALUES WITH (modulus 2, remainder 1)
               payments          | payments_completed | FOR VALUES IN ('Completed')
               payments          | payments_failed    | FOR VALUES IN ('Failed')
               payments          | payments_pending   | FOR VALUES IN ('Pending')
               reviews           | reviews_high       | FOR VALUES FROM (4) TO (6)
               reviews           | reviews_low        | FOR VALUES FROM (1) TO (3)
               reviews           | reviews_mid        | FOR VALUES FROM (3) TO (4)

  - Bukti tableoid::regclass:
     order_id | customer_id | total_amount | physical_partition
    ----------+-------------+--------------+--------------------
            1 |          10 |      4900.85 | orders_p1
            2 |          65 |      2964.71 | orders_p0
           10 |          21 |      3755.60 | orders_p0
           11 |          37 |      4613.67 | orders_p1

  - Bukti EXPLAIN Partition Pruning:
     Seq Scan on orders_p0 orders (Filter: (order_id = 10))  -- orders_p1 di-prune!
     Seq Scan on payments_completed (Filter: (status = 'Completed'))
```

---

### B. Pembuktian Sharding, Boundary Constraint, dan FDW
Jalankan file [query/task2_sharding_proof.sql](query/task2_sharding_proof.sql):
```bash
# Uji di Shard 1 (Port 5432):
docker exec -it postgres-primary-1 psql -U primary -d postgres -f /query/task2_sharding_proof.sql

# Uji di Shard 2 (Port 5433):
docker exec -it postgres-primary-2 psql -U primary -d postgres -f /query/task2_sharding_proof.sql
```

**Hasil Pengujian yang Ditampilkan**:
```text
  1. Bukti Rentang Shard Lokal:
     Shard 1: Customers ID 1..75 (Total 75), Orders ID 1..100 (Total 100)
     Shard 2: Customers ID 1001..1075 (Total 75), Orders ID 1001..1100 (Total 100)

  2. Bukti Boundary Check Constraint:
     NOTICE: SUCCESS: INSERT customer_id 1500 berhasil ditolak oleh chk_shard_customers.

  3. Bukti Sequence Separation (Anti-Collision):
     Shard 1 NextVal -> customer_id = 76 (Band 1..1000)
     Shard 2 NextVal -> customer_id = 1076 (Band 1001..2000)

  4. Bukti Trigger Penjaga Constraint Bisnis:
     NOTICE: SUCCESS: Duplicate payment berhasil dicegah oleh trigger: Business Rule Violation: order_id 1 already has a payment record.
     NOTICE: SUCCESS: Duplicate review berhasil dicegah oleh trigger: Business Rule Violation: customer_id ... already reviewed product_id ...

  5. Bukti Agregasi Global via Distributed Views:
     v_distributed_customers : 150 rows
     v_distributed_orders    : 200 rows
     v_distributed_order_items: 611 rows
```

---

### C. Pembuktian Replikasi Master-Slave
Jalankan file [query/task2_replication_proof.sql](query/task2_replication_proof.sql):
```bash
docker exec -it postgres-primary-1 psql -U primary -d postgres -f /query/task2_replication_proof.sql
```

**Hasil Pengujian yang Ditampilkan**:
```text
  1. Status Primary (pg_is_in_recovery() = false).
  2. Status Standby (pg_is_in_recovery() = true, read-only).
  3. Replikasi Data Real-time:
     - INSERT order_id 8888 di Primary 1.
     - SELECT di Standby 1 (port 5442) -> Data langsung muncul!
     - DELETE di Primary 1 -> Data langsung terhapus dari Standby 1!
  4. Replay Pause & Resume:
     - pg_wal_replay_pause() -> status paused = true.
     - pg_wal_replay_resume() -> status paused = false.
```

---

## Database Schema Detail

### Customers (Sharded)
| Column | Type | Constraints |
|---|---|---|
| customer_id | SERIAL | PRIMARY KEY, CHECK (rentang shard) |
| first_name | VARCHAR(50) | NOT NULL |
| last_name | VARCHAR(50) | NOT NULL |
| email | VARCHAR(100) | UNIQUE, NOT NULL |
| phone | VARCHAR(30) | |
| address_line | VARCHAR(255) | |
| city | VARCHAR(50) | |
| state | VARCHAR(50) | |
| zip_code | VARCHAR(20) | |
| created_at | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP |

### Categories (Replicated)
| Column | Type | Constraints |
|---|---|---|
| category_id | SERIAL | PRIMARY KEY |
| name | VARCHAR(100) | NOT NULL |
| description | TEXT | |
| parent_category_id | INT | FK → Categories(category_id) |

### Suppliers (Replicated)
| Column | Type | Constraints |
|---|---|---|
| supplier_id | SERIAL | PRIMARY KEY |
| name | VARCHAR(100) | NOT NULL |
| contact_name | VARCHAR(100) | |
| phone | VARCHAR(20) | |
| email | VARCHAR(100) | |
| address | TEXT | |

### Products (Replicated)
| Column | Type | Constraints |
|---|---|---|
| product_id | SERIAL | PRIMARY KEY |
| name | VARCHAR(200) | NOT NULL |
| description | TEXT | |
| price | DECIMAL(10,2) | NOT NULL, CHECK (price >= 0) |
| cost | DECIMAL(10,2) | CHECK (cost >= 0) |
| category_id | INT | FK → Categories(category_id) |
| supplier_id | INT | FK → Suppliers(supplier_id) |
| created_at | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP |

### Warehouses (Replicated)
| Column | Type | Constraints |
|---|---|---|
| warehouse_id | SERIAL | PRIMARY KEY |
| name | VARCHAR(100) | NOT NULL |
| address | TEXT | |
| city | VARCHAR(50) | |
| state | VARCHAR(50) | |
| zip_code | VARCHAR(20) | |

### Inventory (Replicated)
| Column | Type | Constraints |
|---|---|---|
| product_id | INT | PK, FK → Products(product_id) ON DELETE CASCADE |
| warehouse_id | INT | PK, FK → Warehouses(warehouse_id) ON DELETE CASCADE |
| quantity_on_hand | INT | NOT NULL, DEFAULT 0 |
| reorder_level | INT | DEFAULT 10 |

### Coupons (Replicated)
| Column | Type | Constraints |
|---|---|---|
| coupon_id | SERIAL | PRIMARY KEY |
| code | VARCHAR(50) | UNIQUE, NOT NULL |
| description | VARCHAR(255) | |
| discount_type | VARCHAR(20) | NOT NULL, CHECK IN ('Percentage', 'Fixed') |
| discount_value | DECIMAL(10,2) | NOT NULL, CHECK (discount_value >= 0) |
| valid_from | DATE | NOT NULL |
| valid_to | DATE | NOT NULL |
| usage_limit | INT | |

### Orders (Sharded & Partitioned by Hash on `order_id`)
| Column | Type | Constraints |
|---|---|---|
| order_id | SERIAL | PRIMARY KEY, CHECK (rentang shard) |
| customer_id | INT | FK → Customers(customer_id), NOT NULL |
| coupon_id | INT | FK → Coupons(coupon_id), NULL |
| order_date | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP |
| status | VARCHAR(20) | NOT NULL, CHECK IN ('Pending', 'Paid', 'Shipped', 'Delivered', 'Cancelled') |
| total_amount | DECIMAL(10,2) | NOT NULL, CHECK (total_amount >= 0) |
*Partisi*: `orders_p0` (hash remainder 0), `orders_p1` (hash remainder 1).

### Order_Items (Sharded)
| Column | Type | Constraints |
|---|---|---|
| order_item_id | SERIAL | PRIMARY KEY |
| order_id | INT | FK → Orders(order_id) ON DELETE CASCADE, NOT NULL |
| product_id | INT | FK → Products(product_id), NOT NULL |
| quantity | INT | NOT NULL, CHECK (quantity > 0) |
| unit_price | DECIMAL(10,2) | NOT NULL, CHECK (unit_price >= 0) |
| discount | DECIMAL(5,2) | DEFAULT 0.00, CHECK (discount >= 0) |

### Payments (Sharded & Partitioned by List on `status`)
| Column | Type | Constraints |
|---|---|---|
| payment_id | SERIAL | PRIMARY KEY (payment_id, status) |
| order_id | INT | FK → Orders(order_id), UNIQUE (order_id, status), NOT NULL |
| payment_date | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP |
| amount | DECIMAL(10,2) | NOT NULL, CHECK (amount >= 0) |
| method | VARCHAR(20) | NOT NULL, CHECK IN ('Credit Card', 'PayPal', 'Bank Transfer', 'Gift Card') |
| status | VARCHAR(20) | NOT NULL, CHECK IN ('Pending', 'Completed', 'Failed') |
*Partisi*: `payments_completed`, `payments_pending`, `payments_failed`.  
*Trigger Enforced*: `check_payment_order_unique` (1 Order = 1 Payment).

### Shipments (Sharded)
| Column | Type | Constraints |
|---|---|---|
| shipment_id | SERIAL | PRIMARY KEY |
| order_id | INT | UNIQUE, FK → Orders(order_id), NOT NULL |
| warehouse_id | INT | FK → Warehouses(warehouse_id), NOT NULL |
| carrier | VARCHAR(50) | |
| tracking_number | VARCHAR(100) | |
| shipped_date | TIMESTAMP | |
| delivered_date | TIMESTAMP | CHECK (delivered_date IS NULL OR shipped_date IS NOT NULL) |

### Reviews (Sharded & Partitioned by Range on `rating`)
| Column | Type | Constraints |
|---|---|---|
| review_id | SERIAL | PRIMARY KEY (review_id, rating) |
| product_id | INT | FK → Products(product_id) ON DELETE CASCADE, NOT NULL |
| customer_id | INT | FK → Customers(customer_id) ON DELETE CASCADE, NOT NULL |
| rating | INT | NOT NULL, CHECK (rating BETWEEN 1 AND 5) |
| comment | TEXT | |
| review_date | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP |
| | | UNIQUE (product_id, customer_id, rating) |
*Partisi*: `reviews_low` (1–2), `reviews_mid` (3), `reviews_high` (4–5).  
*Trigger Enforced*: `check_review_customer_product_unique` (1 Review per Customer per Produk).
