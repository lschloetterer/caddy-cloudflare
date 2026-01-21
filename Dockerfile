FROM caddy:2.10.2-builder-alpine@sha256:d315d063ae1b9f8d5768f9d6fa98d8f77365f49b4f2c28f8ddc991b29b0c2a8a AS builder

RUN xcaddy build --with github.com/caddy-dns/cloudflare

FROM caddy:2.10.2-alpine@sha256:f2b257f20955d6be2229bed86bad24193eeb8c4dc962a4031a6eb42344ffa457

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
