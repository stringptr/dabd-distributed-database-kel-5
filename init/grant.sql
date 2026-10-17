GRANT USAGE ON SCHEMA public TO standby;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO standby;
GRANT EXECUTE ON FUNCTION pg_wal_replay_pause() TO standby;
GRANT EXECUTE ON FUNCTION pg_wal_replay_resume() TO standby;
GRANT EXECUTE ON FUNCTION pg_get_wal_replay_pause_state() TO standby;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT ON TABLES TO standby;
