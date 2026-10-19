-- =====================================================================
-- TUGAS 2: PEMBUKTIAN TABLE PARTITIONING (DECLARATIVE PARTITIONING)
-- Dapat dijalankan pada postgres-primary-1 (port 5432) atau postgres-primary-2 (port 5433)
-- =====================================================================

-- ---------------------------------------------------------------------
-- 1. Inspeksi Metadata Tabel Terpartisi dan Partisi Anak
-- ---------------------------------------------------------------------
SELECT
    parent.relname AS partitioned_table,
    child.relname AS partition_name,
    pg_get_expr(child.relpartbound, child.oid) AS partition_bound
FROM pg_inherits
JOIN pg_class parent ON pg_inherits.inhparent = parent.oid
JOIN pg_class child  ON pg_inherits.inhrelid = child.oid
ORDER BY parent.relname, child.relname;

-- ---------------------------------------------------------------------
-- 2. Pembuktian Distribusi Data di Setiap Partisi
-- ---------------------------------------------------------------------

-- A. Hash Partitioning pada tabel Orders (order_id)
SELECT 'Total Orders' AS label, COUNT(*) AS count FROM orders
UNION ALL
SELECT 'orders_p0 (Modulus 2, Remainder 0)', COUNT(*) FROM orders_p0
UNION ALL
SELECT 'orders_p1 (Modulus 2, Remainder 1)', COUNT(*) FROM orders_p1;

-- B. List Partitioning pada tabel Payments (status)
SELECT 'Total Payments' AS label, COUNT(*) AS count FROM payments
UNION ALL
SELECT 'payments_completed', COUNT(*) FROM payments_completed
UNION ALL
SELECT 'payments_pending', COUNT(*) FROM payments_pending
UNION ALL
SELECT 'payments_failed', COUNT(*) FROM payments_failed;

-- C. Range Partitioning pada tabel Reviews (rating)
SELECT 'Total Reviews' AS label, COUNT(*) AS count FROM reviews
UNION ALL
SELECT 'reviews_low (Rating 1-2)', COUNT(*) FROM reviews_low
UNION ALL
SELECT 'reviews_mid (Rating 3)', COUNT(*) FROM reviews_mid
UNION ALL
SELECT 'reviews_high (Rating 4-5)', COUNT(*) FROM reviews_high;

-- ---------------------------------------------------------------------
-- 3. Pembuktian Partition Pruning (Query Planner hanya scan partisi relevan)
-- ---------------------------------------------------------------------

-- Cek EXPLAIN: filter order_id tertentu (hanya partisi target yang di-scan)
EXPLAIN SELECT * FROM orders WHERE order_id = 10;
EXPLAIN SELECT * FROM orders WHERE order_id = 11;

-- Cek EXPLAIN: status = 'Completed' (harus hanya scan payments_completed)
EXPLAIN SELECT * FROM payments WHERE status = 'Completed';

-- Cek EXPLAIN: rating = 5 (harus hanya scan reviews_high)
EXPLAIN SELECT * FROM reviews WHERE rating = 5;

-- ---------------------------------------------------------------------
-- 4. Pembuktian Routing Fisik via tableoid::regclass
-- Catatan: PostgreSQL Hash Partitioning menggunakan fungsi hash internal 32-bit,
-- bukan modulo integer langsung (bukan genap=p0, ganjil=p1).
-- tableoid::regclass adalah cara kanonik untuk membuktikan partisi fisik baris.
-- ---------------------------------------------------------------------
SELECT 
    order_id, 
    customer_id, 
    total_amount, 
    tableoid::regclass AS physical_partition
FROM orders 
WHERE order_id IN (1, 2, 10, 11)
ORDER BY order_id;

-- ---------------------------------------------------------------------
-- 5. Pembuktian Insert Routing Otomatis ke Partisi Anak
-- ---------------------------------------------------------------------
DO $$
DECLARE
    v_cust_id INT;
BEGIN
    SELECT customer_id INTO v_cust_id FROM customers LIMIT 1;

    -- Insert order uji dalam batas band shard lokal
    INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount)
    VALUES (990, v_cust_id, NULL, CURRENT_TIMESTAMP, 'Paid', 150.00)
    ON CONFLICT (order_id) DO NOTHING;

    INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount)
    VALUES (991, v_cust_id, NULL, CURRENT_TIMESTAMP, 'Pending', 250.00)
    ON CONFLICT (order_id) DO NOTHING;
END $$;

-- Verifikasi partisi fisik yang menampung baris uji via tableoid::regclass:
SELECT 
    order_id, 
    status, 
    tableoid::regclass AS assigned_partition
FROM orders 
WHERE order_id IN (990, 991);

-- Bersihkan data uji:
DELETE FROM orders WHERE order_id IN (990, 991);
