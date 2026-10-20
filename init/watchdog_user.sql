-- Role superuser khusus watchdog auto-failover (failover/watchdog.sh).
-- pg_promote() butuh superuser; role ini hanya dipakai container watchdog.
-- Ikut tersalin ke standby via pg_basebackup, jadi tersedia saat promosi.
CREATE ROLE watchdog
WITH
    SUPERUSER
    LOGIN
    PASSWORD 'watchdog';
