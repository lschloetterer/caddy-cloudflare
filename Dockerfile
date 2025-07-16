FROM caddy:2.10.0-builder-alpine@sha256:e027c475878bb469d08e32d36b328a1be7b62f3c97d3de46f2e6fad694b75cf8 AS builder

RUN xcaddy build --with github.com/caddy-dns/cloudflare

FROM caddy:2.10.0-alpine@sha256:9145a745121386aac7bce2887883b9f060154c770030d53d422d5f69a3b6cfa2

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
