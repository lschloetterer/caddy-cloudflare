FROM caddy:2.9.1-builder-alpine@sha256:bfa436d2711d1294501ba0f72f149d8c5dad237fc8e9c9b9aec682df8438ec73 AS builder

RUN xcaddy build --with github.com/caddy-dns/cloudflare

FROM caddy:2.9.1-alpine@sha256:e70ccf0c9821a88303671ef22d7b5e2d2b6057a8b18703022d755ba4d5fd35cd

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
