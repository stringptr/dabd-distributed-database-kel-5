-- ============================================================
-- Shard 1: Boundary Constraints & Sequence Bands
-- ============================================================

-- Boundary check constraint: ID harus berada dalam rentang Shard 1 (1..1000)
ALTER TABLE customers ADD CONSTRAINT chk_shard_customers CHECK (customer_id BETWEEN 1 AND 1000);
ALTER TABLE orders    ADD CONSTRAINT chk_shard_orders    CHECK (order_id BETWEEN 1 AND 1000);

-- Sequence bands untuk insert baru (dimulai setelah seed 75 & 100, batas atas 1000)
ALTER SEQUENCE customers_customer_id_seq RESTART WITH 76 MAXVALUE 1000;
ALTER SEQUENCE orders_order_id_seq RESTART WITH 101 MAXVALUE 1000;
