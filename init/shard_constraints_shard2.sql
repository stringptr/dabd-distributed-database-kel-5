-- ============================================================
-- Shard 2: Boundary Constraints & Sequence Bands
-- ============================================================

-- Boundary check constraint: ID harus berada dalam rentang Shard 2 (1001..2000)
ALTER TABLE customers ADD CONSTRAINT chk_shard_customers CHECK (customer_id BETWEEN 1001 AND 2000);
ALTER TABLE orders    ADD CONSTRAINT chk_shard_orders    CHECK (order_id BETWEEN 1001 AND 2000);

-- Sequence bands untuk insert baru (dimulai setelah seed 1075 & 1100, batas atas 2000)
ALTER SEQUENCE customers_customer_id_seq RESTART WITH 1076 MAXVALUE 2000;
ALTER SEQUENCE orders_order_id_seq RESTART WITH 1101 MAXVALUE 2000;
