FROM caddy:2.9.1-builder-alpine@sha256:ca7cf1f32bfd454db7517326d4282b6aa9794843e492f5d29a051d8758874d0b AS builder

RUN xcaddy build --with github.com/caddy-dns/cloudflare

FROM caddy:2.9.1-alpine@sha256:1131a7f215fdcbf0543a7096fceddd2304f14608b3c2c852224f3ee6b3dd6a80

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
