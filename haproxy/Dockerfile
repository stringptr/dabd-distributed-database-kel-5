# Image HAProxy + postgresql-client (untuk external-check: SELECT pg_is_in_recovery())
FROM docker.io/haproxy:3.1-alpine

USER root
RUN apk add --no-cache postgresql17-client

# Script check harus root-owned & tidak writable oleh group/other (syarat HAProxy)
COPY haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg
COPY check_primary.sh check_replica.sh /usr/local/bin/
RUN chmod 755 /usr/local/bin/check_primary.sh /usr/local/bin/check_replica.sh \
    && chmod 644 /usr/local/etc/haproxy/haproxy.cfg
