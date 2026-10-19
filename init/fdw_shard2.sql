-- =====================================================================
-- Foreign Data Wrapper on Shard 2 (postgres-primary-2)
-- Allows Shard 2 to query remote tables from Shard 1 (postgres-primary-1)
-- =====================================================================

CREATE EXTENSION IF NOT EXISTS postgres_fdw;

-- Remote foreign server pointing to Shard 1
CREATE SERVER IF NOT EXISTS shard1_server
    FOREIGN DATA WRAPPER postgres_fdw
    OPTIONS (host 'postgres-primary-1', port '5432', dbname 'postgres');

-- User mapping for superuser (primary) - Quoted "primary" as it is a reserved SQL keyword
CREATE USER MAPPING IF NOT EXISTS FOR "primary"
    SERVER shard1_server
    OPTIONS (user 'primary', password 'primary');

-- User mapping for replica user (standby)
CREATE USER MAPPING IF NOT EXISTS FOR standby
    SERVER shard1_server
    OPTIONS (user 'standby', password 'standby');

-- ---------------------------------------------------------------------
-- Foreign Tables (Milik Shard 1 diakses dari Shard 2)
-- ---------------------------------------------------------------------

CREATE FOREIGN TABLE IF NOT EXISTS foreign_customers_shard1 (
    customer_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(30),
    address_line VARCHAR(255),
    city VARCHAR(50),
    state VARCHAR(50),
    zip_code VARCHAR(20),
    created_at TIMESTAMP
) SERVER shard1_server OPTIONS (schema_name 'public', table_name 'customers');

CREATE FOREIGN TABLE IF NOT EXISTS foreign_orders_shard1 (
    order_id INT,
    customer_id INT,
    coupon_id INT,
    order_date TIMESTAMP,
    status VARCHAR(20),
    total_amount DECIMAL(10,2)
) SERVER shard1_server OPTIONS (schema_name 'public', table_name 'orders');

CREATE FOREIGN TABLE IF NOT EXISTS foreign_order_items_shard1 (
    order_item_id INT,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10,2),
    discount DECIMAL(5,2)
) SERVER shard1_server OPTIONS (schema_name 'public', table_name 'order_items');

CREATE FOREIGN TABLE IF NOT EXISTS foreign_payments_shard1 (
    payment_id INT,
    order_id INT,
    payment_date TIMESTAMP,
    amount DECIMAL(10,2),
    method VARCHAR(20),
    status VARCHAR(20)
) SERVER shard1_server OPTIONS (schema_name 'public', table_name 'payments');

CREATE FOREIGN TABLE IF NOT EXISTS foreign_shipments_shard1 (
    shipment_id INT,
    order_id INT,
    warehouse_id INT,
    carrier VARCHAR(50),
    tracking_number VARCHAR(100),
    shipped_date TIMESTAMP,
    delivered_date TIMESTAMP
) SERVER shard1_server OPTIONS (schema_name 'public', table_name 'shipments');

CREATE FOREIGN TABLE IF NOT EXISTS foreign_reviews_shard1 (
    review_id INT,
    product_id INT,
    customer_id INT,
    rating INT,
    comment TEXT,
    review_date TIMESTAMP
) SERVER shard1_server OPTIONS (schema_name 'public', table_name 'reviews');

-- ---------------------------------------------------------------------
-- Unified Distributed Views (Menggabungkan Local Shard 2 + Remote Shard 1)
-- ---------------------------------------------------------------------

CREATE OR REPLACE VIEW v_distributed_customers AS
    SELECT customer_id, first_name, last_name, email, phone, address_line, city, state, zip_code, created_at, 2 AS shard_id
    FROM customers
    UNION ALL
    SELECT customer_id, first_name, last_name, email, phone, address_line, city, state, zip_code, created_at, 1 AS shard_id
    FROM foreign_customers_shard1;

CREATE OR REPLACE VIEW v_distributed_orders AS
    SELECT order_id, customer_id, coupon_id, order_date, status, total_amount, 2 AS shard_id
    FROM orders
    UNION ALL
    SELECT order_id, customer_id, coupon_id, order_date, status, total_amount, 1 AS shard_id
    FROM foreign_orders_shard1;

CREATE OR REPLACE VIEW v_distributed_order_items AS
    SELECT order_item_id, order_id, product_id, quantity, unit_price, discount, 2 AS shard_id
    FROM order_items
    UNION ALL
    SELECT order_item_id, order_id, product_id, quantity, unit_price, discount, 1 AS shard_id
    FROM foreign_order_items_shard1;

CREATE OR REPLACE VIEW v_distributed_payments AS
    SELECT payment_id, order_id, payment_date, amount, method, status, 2 AS shard_id
    FROM payments
    UNION ALL
    SELECT payment_id, order_id, payment_date, amount, method, status, 1 AS shard_id
    FROM foreign_payments_shard1;

CREATE OR REPLACE VIEW v_distributed_shipments AS
    SELECT shipment_id, order_id, warehouse_id, carrier, tracking_number, shipped_date, delivered_date, 2 AS shard_id
    FROM shipments
    UNION ALL
    SELECT shipment_id, order_id, warehouse_id, carrier, tracking_number, shipped_date, delivered_date, 1 AS shard_id
    FROM foreign_shipments_shard1;

CREATE OR REPLACE VIEW v_distributed_reviews AS
    SELECT review_id, product_id, customer_id, rating, comment, review_date, 2 AS shard_id
    FROM reviews
    UNION ALL
    SELECT review_id, product_id, customer_id, rating, comment, review_date, 1 AS shard_id
    FROM foreign_reviews_shard1;

GRANT SELECT ON ALL TABLES IN SCHEMA public TO standby;
