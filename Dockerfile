FROM caddy:2.9.1-builder-alpine@sha256:11739cd86542d9e2e371e7d093065fe42a7b852d124220812f3a782f1b56132b AS builder

RUN xcaddy build --with github.com/caddy-dns/cloudflare

FROM caddy:2.9.1-alpine@sha256:b4e3952384eb9524a887633ce65c752dd7c71314d2c2acf98cd5c715aaa534f0

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
