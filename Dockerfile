FROM caddy:2.9.1-builder-alpine@sha256:acb4963e515eb00db086a5639f5a509a56c06ee87573239c7b49fccb56a60f1f AS builder

RUN xcaddy build --with github.com/caddy-dns/cloudflare

FROM caddy:2.9.1-alpine@sha256:b60636634fd2aebaf9460cf60997ad83aad6b139318d5713e2b78a60f52b139c

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
