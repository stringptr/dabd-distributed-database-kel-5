-- =====================================================================
-- TUGAS 2: PEMBUKTIAN REPLIKASI MASTER-SLAVE PADA SETIAP SHARD
-- =====================================================================

-- =====================================================================
-- 1. INSPEKSI STATUS REPLIKASI DARI SISI PRIMARY (MASTER)
-- =====================================================================

-- Jalankan di Primary Shard 1 (Port 5432) atau Primary Shard 2 (Port 5433):

-- 1.A. Verifikasi node adalah PRIMARY (bukan standby)
SELECT 
    inet_server_addr() AS server_ip,
    inet_server_port() AS server_port,
    pg_is_in_recovery() AS is_in_recovery; -- HARUS FALSE (Primary aktif)

-- 1.B. Verifikasi Streaming Replication Slot
SELECT 
    slot_name,
    plugin,
    slot_type,
    active,
    wal_status
FROM pg_replication_slots;

-- 1.C. Verifikasi Metrik Replikasi & Lag ke Standby
SELECT
    pid,
    client_addr,
    application_name,
    state,
    sync_state,
    pg_wal_lsn_diff(pg_current_wal_lsn(), sent_lsn)   AS lag_bytes_send,
    pg_wal_lsn_diff(pg_current_wal_lsn(), write_lsn)  AS lag_bytes_write,
    pg_wal_lsn_diff(pg_current_wal_lsn(), flush_lsn)  AS lag_bytes_flush,
    pg_wal_lsn_diff(pg_current_wal_lsn(), replay_lsn) AS lag_bytes_replay,
    replay_lag
FROM pg_stat_replication;


-- =====================================================================
-- 2. VERIFIKASI STATUS STANDBY / SLAVE (READ-ONLY)
-- =====================================================================

-- Jalankan di Standby Shard 1 (Port 5442) atau Standby Shard 2 (Port 5443):

-- 2.A. Verifikasi node adalah STANDBY
SELECT 
    inet_server_addr() AS server_ip,
    inet_server_port() AS server_port,
    pg_is_in_recovery() AS is_in_recovery; -- HARUS TRUE (Standby / Slave)

-- 2.B. Bukti Standby bersifat Read-Only (INSERT harus gagal)
-- Statement di bawah ini akan menghasilkan ERROR: cannot execute INSERT in a read-only transaction
-- INSERT INTO customers (customer_id, first_name, last_name, email) VALUES (9999, 'Test', 'Standby', 'standby_test@example.com');


-- =====================================================================
-- 3. PEMBUKTIAN REAL-TIME REPLICATION DATA FLOW (WRITE DI PRIMARY -> TERBACA DI STANDBY)
-- =====================================================================

-- LANGKAH A (DI PRIMARY SHARD 1, Port 5432):
-- Tulis data baru:
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount)
VALUES (8888, 1, NULL, CURRENT_TIMESTAMP, 'Paid', 888.00);

-- LANGKAH B (DI STANDBY SHARD 1, Port 5442):
-- Verifikasi data langsung tereplikasi:
SELECT 
    order_id,
    customer_id,
    status,
    total_amount,
    'Replicated to Standby 1 successfully' AS status_note
FROM orders
WHERE order_id = 8888;

-- LANGKAH C (BERSIHKAN DATA UJI DI PRIMARY SHARD 1, Port 5432):
DELETE FROM orders WHERE order_id = 8888;

-- LANGKAH D (DI STANDBY SHARD 1, Port 5442):
-- Verifikasi data terhapus dari Standby:
SELECT COUNT(*) AS should_be_zero FROM orders WHERE order_id = 8888;


-- =====================================================================
-- 4. PENGUJIAN REPLAY PAUSE & RESUME PADA STANDBY
-- =====================================================================

-- Jalankan di Standby (Port 5442 atau 5443):

-- Pause WAL replay:
SELECT pg_wal_replay_pause();

-- Cek selisih LSN saat replay dipause:
SELECT
    pg_last_wal_receive_lsn() AS received_lsn,
    pg_last_wal_replay_lsn()  AS replayed_lsn,
    pg_wal_lsn_diff(pg_last_wal_receive_lsn(), pg_last_wal_replay_lsn()) AS lag_bytes_paused,
    pg_is_wal_replay_paused() AS is_paused;

-- Lanjutkan WAL replay:
SELECT pg_wal_replay_resume();

-- Cek kembali status replay:
SELECT pg_is_wal_replay_paused() AS is_paused_after_resume;
