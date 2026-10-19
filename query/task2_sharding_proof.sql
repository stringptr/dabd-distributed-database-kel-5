-- =====================================================================
-- TUGAS 2: PEMBUKTIAN HORIZONTAL SHARDING & CROSS-SHARD FEDERATION (FDW)
-- =====================================================================

-- =====================================================================
-- BAGIAN A: PENGUJIAN DI SHARD 1 (postgres-primary-1, Port 5432)
-- =====================================================================

-- 1. Bukti Data Lokal Shard 1 (Customer ID 1..75, Order ID 1..100)
SELECT 
    'Shard 1 Local Customers' AS dataset,
    MIN(customer_id) AS min_id,
    MAX(customer_id) AS max_id,
    COUNT(*) AS total_rows
FROM customers;

SELECT 
    'Shard 1 Local Orders' AS dataset,
    MIN(order_id) AS min_id,
    MAX(order_id) AS max_id,
    COUNT(*) AS total_rows
FROM orders;

-- 2. Bukti Replicated Tables Lengkap di Shard 1
SELECT 'Categories' AS tbl, COUNT(*) FROM categories
UNION ALL SELECT 'Suppliers', COUNT(*) FROM suppliers
UNION ALL SELECT 'Warehouses', COUNT(*) FROM warehouses
UNION ALL SELECT 'Products', COUNT(*) FROM products
UNION ALL SELECT 'Coupons', COUNT(*) FROM coupons
UNION ALL SELECT 'Inventory', COUNT(*) FROM inventory;

-- 3. Bukti Foreign Data Wrapper (FDW) Mengakses Shard 2
SELECT srvname, srvfdw FROM pg_foreign_server;

-- Query tabel foreign Shard 2 dari Shard 1:
SELECT 
    'Remote Shard 2 Customers via FDW' AS dataset,
    MIN(customer_id) AS min_id,
    MAX(customer_id) AS max_id,
    COUNT(*) AS total_rows
FROM foreign_customers_shard2;

SELECT 
    'Remote Shard 2 Orders via FDW' AS dataset,
    MIN(order_id) AS min_id,
    MAX(order_id) AS max_id,
    COUNT(*) AS total_rows
FROM foreign_orders_shard2;

-- 4. Bukti Distributed Views (Menggabungkan Seluruh Data Lintas Shard)
SELECT 'v_distributed_customers' AS view_name, COUNT(*) AS total_rows FROM v_distributed_customers
UNION ALL
SELECT 'v_distributed_orders', COUNT(*) FROM v_distributed_orders
UNION ALL
SELECT 'v_distributed_order_items', COUNT(*) FROM v_distributed_order_items
UNION ALL
SELECT 'v_distributed_payments', COUNT(*) FROM v_distributed_payments
UNION ALL
SELECT 'v_distributed_shipments', COUNT(*) FROM v_distributed_shipments
UNION ALL
SELECT 'v_distributed_reviews', COUNT(*) FROM v_distributed_reviews;

-- Agregasi pendapatan global seluruh cluster e-commerce lintas shard:
SELECT 
    COUNT(order_id) AS total_orders_all_shards,
    SUM(total_amount) AS total_revenue_all_shards,
    ROUND(AVG(total_amount), 2) AS avg_order_value_all_shards
FROM v_distributed_orders;

-- 5. Bukti Boundary Check Constraint (Penolakan ID di Luar Rentang Shard)
-- ID 1500 berada di luar band Shard 1 (1..1000), harus GAGAL ditolak oleh chk_shard_customers:
DO $$
BEGIN
    INSERT INTO customers (customer_id, first_name, last_name, email)
    VALUES (1500, 'Illegal', 'Customer', 'illegal_shard1@example.com');
    RAISE EXCEPTION 'CHECK constraint chk_shard_customers gagal bekerja!';
EXCEPTION
    WHEN check_violation THEN
        RAISE NOTICE 'SUCCESS: INSERT customer_id 1500 berhasil ditolak oleh chk_shard_customers.';
END $$;

-- 6. Bukti Pemisahan Sequence Antar Shard (Tidak Bentrok)
-- Insert customer baru tanpa eksplisit ID, harus mengambil sequence Shard 1 (mulai dari 76):
INSERT INTO customers (first_name, last_name, email, phone)
VALUES ('NewShard1', 'User', 'new_shard1_user@example.com', '123-456')
RETURNING customer_id, first_name, last_name;

-- Bersihkan customer uji:
DELETE FROM customers WHERE email = 'new_shard1_user@example.com';

-- 7. Bukti Trigger Penjaga Constraint Bisnis
-- 7.A. Trigger 1 Order = 1 Payment: Coba insert payment kedua untuk order_id = 1 (harus ditolak):
DO $$
BEGIN
    INSERT INTO payments (order_id, amount, method, status)
    VALUES (1, 99.00, 'Credit Card', 'Pending');
    RAISE EXCEPTION 'Trigger check_payment_order_unique gagal mencegah duplikat order payment!';
EXCEPTION
    WHEN OTHERS THEN
        RAISE NOTICE 'SUCCESS: Duplicate payment berhasil dicegah oleh trigger: %', SQLERRM;
END $$;

-- 7.B. Trigger 1 Review per Customer per Produk: Coba review kedua oleh customer 1 pada produk yang sudah direview:
DO $$
DECLARE
    v_pid INT;
    v_cid INT;
BEGIN
    SELECT product_id, customer_id INTO v_pid, v_cid FROM reviews LIMIT 1;
    INSERT INTO reviews (product_id, customer_id, rating, comment)
    VALUES (v_pid, v_cid, 5, 'Duplicate review attempt');
    RAISE EXCEPTION 'Trigger check_review_customer_product_unique gagal mencegah duplicate review!';
EXCEPTION
    WHEN OTHERS THEN
        RAISE NOTICE 'SUCCESS: Duplicate review berhasil dicegah oleh trigger: %', SQLERRM;
END $$;


-- =====================================================================
-- BAGIAN B: PENGUJIAN DI SHARD 2 (postgres-primary-2, Port 5433)
-- =====================================================================

-- 1. Bukti Data Lokal Shard 2 (Customer ID 1001..1075, Order ID 1001..1100)
SELECT 
    'Shard 2 Local Customers' AS dataset,
    MIN(customer_id) AS min_id,
    MAX(customer_id) AS max_id,
    COUNT(*) AS total_rows
FROM customers;

SELECT 
    'Shard 2 Local Orders' AS dataset,
    MIN(order_id) AS min_id,
    MAX(order_id) AS max_id,
    COUNT(*) AS total_rows
FROM orders;

-- 2. Query tabel foreign Shard 1 dari Shard 2:
SELECT 
    'Remote Shard 1 Customers via FDW' AS dataset,
    MIN(customer_id) AS min_id,
    MAX(customer_id) AS max_id,
    COUNT(*) AS total_rows
FROM foreign_customers_shard1;

-- 3. Bukti Boundary Check Constraint di Shard 2 (ID 50 di luar band 1001..2000):
DO $$
BEGIN
    INSERT INTO customers (customer_id, first_name, last_name, email)
    VALUES (50, 'Illegal', 'Customer', 'illegal_shard2@example.com');
    RAISE EXCEPTION 'CHECK constraint chk_shard_customers pada Shard 2 gagal bekerja!';
EXCEPTION
    WHEN check_violation THEN
        RAISE NOTICE 'SUCCESS: INSERT customer_id 50 berhasil ditolak oleh chk_shard_customers pada Shard 2.';
END $$;

-- 4. Bukti Sequence Shard 2 (mulai dari 1076):
INSERT INTO customers (first_name, last_name, email, phone)
VALUES ('NewShard2', 'User', 'new_shard2_user@example.com', '789-012')
RETURNING customer_id, first_name, last_name;

-- Bersihkan customer uji di Shard 2:
DELETE FROM customers WHERE email = 'new_shard2_user@example.com';
