FROM caddy:2.10.2-builder-alpine@sha256:c020d8711e3b8b567e1f87bd8489719f2fa3aa1bf7c3433294a1fda5722f64ec AS builder

RUN xcaddy build --with github.com/caddy-dns/cloudflare

FROM caddy:2.10.2-alpine@sha256:f2b257f20955d6be2229bed86bad24193eeb8c4dc962a4031a6eb42344ffa457

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
