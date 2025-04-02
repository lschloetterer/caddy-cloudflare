FROM caddy:2.9.1-builder-alpine@sha256:0d51ab53402e144be9cab449f5adfec681b87d481dcd175230813427d5e00f00 AS builder

RUN xcaddy build --with github.com/caddy-dns/cloudflare

FROM caddy:2.9.1-alpine@sha256:b4e3952384eb9524a887633ce65c752dd7c71314d2c2acf98cd5c715aaa534f0

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
