FROM caddy:2.11.4-builder-alpine@sha256:7a8601bc62477d677e977e2bdfc3ae6b532fc05595acb2d61f758488546b0143 AS builder

RUN xcaddy build --with github.com/caddy-dns/cloudflare

FROM caddy:2.11.4-alpine@sha256:5f5c8640aae01df9654968d946d8f1a56c497f1dd5c5cda4cf95ab7c14d58648

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
