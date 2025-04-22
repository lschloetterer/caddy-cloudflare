FROM caddy:2.10.0-builder-alpine@sha256:f7f55f19a45f1487b25a4a8a1f2e21a0eae931531f8a65ad29a2d5e6492c4f17 AS builder

RUN xcaddy build --with github.com/caddy-dns/cloudflare

FROM caddy:2.10.0-alpine@sha256:9aa1eca4d3f9e28df8cdf3d8c010abd2e4a30f6670ebf727eb0bc62261175fde

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
