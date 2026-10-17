SELECT
    c.customer_id,
    c.first_name || ' ' || c.last_name AS customer_name,
    COUNT(o.order_id) AS order_count
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY order_count DESC;


INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount)
VALUES
  (201, 148, NULL, '2026-09-10 10:00:00', 'Paid', 1500.00),
  (202, 148, NULL, '2026-09-11 11:00:00', 'Paid', 2300.00);


INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount)
VALUES
  (201, 5, 2, 382.27, 0.00),
  (201, 10, 1, 291.37, 0.05),
  (202, 8, 3, 65.82, 0.00),
  (202, 11, 1, 257.84, 0.10);


SELECT
    client_addr,
    pg_wal_lsn_diff(pg_current_wal_lsn(), sent_lsn)     AS pending_send,
    pg_wal_lsn_diff(pg_current_wal_lsn(), write_lsn)     AS pending_write,
    pg_wal_lsn_diff(pg_current_wal_lsn(), flush_lsn)     AS pending_flush,
    pg_wal_lsn_diff(pg_current_wal_lsn(), replay_lsn)    AS pending_replay,
    replay_lag
FROM pg_stat_replication;


INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount)
VALUES
  (203, 148, NULL, '2026-09-10 10:00:00', 'Paid', 1500.00),
  (204, 148, NULL, '2026-09-11 11:00:00', 'Paid', 2300.00);


INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount)
VALUES
  (203, 5, 2, 382.27, 0.00),
  (203, 10, 1, 291.37, 0.05),
  (204, 8, 3, 65.82, 0.00),
  (204, 11, 1, 257.84, 0.10);
