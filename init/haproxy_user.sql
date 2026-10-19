-- Role untuk health-check HAProxy (external-check: SELECT pg_is_in_recovery()).
-- Dipakai oleh haproxy/check_primary.sh & check_replica.sh (user "haproxy").
CREATE ROLE haproxy LOGIN PASSWORD 'haproxy';
