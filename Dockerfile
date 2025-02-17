FROM caddy:2.9.1-builder-alpine@sha256:a7da868cc556e38e6003f7129db24c9a29ceceee9e2a4dfc46480e8b0ad7d4a2 AS builder

RUN xcaddy build --with github.com/caddy-dns/cloudflare

FROM caddy:2.9.1-alpine@sha256:b4e3952384eb9524a887633ce65c752dd7c71314d2c2acf98cd5c715aaa534f0

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
