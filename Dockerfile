FROM caddy:2.9.1-builder-alpine@sha256:ca7cf1f32bfd454db7517326d4282b6aa9794843e492f5d29a051d8758874d0b AS builder

RUN xcaddy build --with github.com/caddy-dns/cloudflare

FROM caddy:2.9.1-alpine@sha256:e70ccf0c9821a88303671ef22d7b5e2d2b6057a8b18703022d755ba4d5fd35cd

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
