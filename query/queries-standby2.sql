-- ============================================================
-- Query 3 — Standby 2 (COUNT + ORDER BY)
-- Most active customers by order count
-- ============================================================
SELECT c.customer_id, c.first_name || ' ' || c.last_name AS customer_name, COUNT(o.order_id) AS order_count FROM Customers c LEFT JOIN Orders o ON c.customer_id = o.customer_id GROUP BY c.customer_id, c.first_name, c.last_name ORDER BY order_count DESC;

-- ============================================================
-- Query 4 — Standby 2 (Different from Query 1)
-- Top 10 best-selling products by total quantity sold
-- ============================================================
SELECT
    p.product_id,
    p.name AS product_name,
    SUM(oi.quantity) AS total_qty_sold,
    SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM Order_Items oi
JOIN Products p ON oi.product_id = p.product_id
GROUP BY p.product_id, p.name
ORDER BY total_qty_sold DESC
LIMIT 10;

-- ============================================================
-- Query 5 — Bonus (CASE + SUM + GROUP BY)
-- Revenue breakdown by order status
-- ============================================================
SELECT
    status,
    COUNT(*) AS order_count,
    SUM(total_amount) AS total_revenue,
    CASE
        WHEN status = 'Paid'      THEN 'Completed Transaction'
        WHEN status = 'Shipped'   THEN 'In Transit'
        WHEN status = 'Delivered'  THEN 'Successfully Delivered'
        WHEN status = 'Pending'   THEN 'Awaiting Payment'
        WHEN status = 'Cancelled' THEN 'Cancelled Order'
        ELSE 'Unknown'
    END AS status_category
FROM Orders
GROUP BY status
ORDER BY total_revenue DESC;

SELECT pg_wal_replay_pause();

SELECT
    pg_last_wal_receive_lsn()  AS received,
    pg_last_wal_replay_lsn()   AS replayed,
    pg_wal_lsn_diff(pg_last_wal_receive_lsn(), pg_last_wal_replay_lsn()) AS receive_replay_gap,
    now() - pg_last_xact_replay_timestamp() AS time_since_last_replay;

SELECT pg_wal_replay_resume();