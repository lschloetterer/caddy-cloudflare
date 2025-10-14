FROM caddy:2.10.2-builder-alpine@sha256:b2acaf01a89d5dcf3637e6a5abf2483593e533eba5fd5391a039fd0472e21427 AS builder

RUN xcaddy build --with github.com/caddy-dns/cloudflare

FROM caddy:2.10.2-alpine@sha256:953131cfea8e12bfe1c631a36308e9660e4389f0c3dfb3be957044d3ac92d446

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
