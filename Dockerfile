FROM caddy:2.9.1-builder-alpine@sha256:ecca57d559c108fbefa76c26716c701eb6a623f9d7000bc93169cfedaf882cb4 AS builder

RUN xcaddy build --with github.com/caddy-dns/cloudflare

FROM caddy:2.9.1-alpine@sha256:b4e3952384eb9524a887633ce65c752dd7c71314d2c2acf98cd5c715aaa534f0

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
