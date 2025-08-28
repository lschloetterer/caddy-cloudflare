FROM caddy:2.10.2-builder-alpine@sha256:7b1db717a61f87586e0dd1770c81af4cd23f5479d38fe44df98270aa80a197eb AS builder

RUN xcaddy build --with github.com/caddy-dns/cloudflare

FROM caddy:2.10.2-alpine@sha256:a4180db0805b3725ddf936d2e6290553745c7339c003565da717ee612fd8a888

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
