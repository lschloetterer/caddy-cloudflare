FROM caddy:2.10.2-builder-alpine@sha256:6fe1c9dc798992b754e42e28d92aefb33372d38de74a6381c2b51cadf0244991 AS builder

RUN xcaddy build --with github.com/caddy-dns/cloudflare

FROM caddy:2.10.2-alpine@sha256:a4180db0805b3725ddf936d2e6290553745c7339c003565da717ee612fd8a888

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
