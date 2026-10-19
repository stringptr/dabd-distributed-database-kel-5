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

3. **(Opsional) Generate Ulang Dataset Shard**:
   ```bash
   python init/generate.py
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
