-- ============================================================
-- Query 1 — Standby 1 (JOIN + GROUP BY)
-- Total spending per customer
-- ============================================================
SELECT
    c.customer_id,
    c.first_name || ' ' || c.last_name AS customer_name,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(oi.quantity * oi.unit_price) AS total_spending
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Order_Items oi ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_spending DESC;

-- ============================================================
-- Query 2 — Standby 1 (Schema Query)
-- Average product rating per category
-- ============================================================
SELECT
    cat.category_id,
    cat.name AS category_name,
    COUNT(r.review_id) AS review_count,
    ROUND(AVG(r.rating), 2) AS avg_rating
FROM Reviews r
JOIN Products p ON r.product_id = p.product_id
JOIN Categories cat ON p.category_id = cat.category_id
GROUP BY cat.category_id, cat.name
ORDER BY avg_rating DESC;

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
