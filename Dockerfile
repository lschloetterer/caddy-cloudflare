FROM caddy:2.9.1-builder-alpine@sha256:c82c536196354acff870ce9f99795ed7bff7d1ed85c52c8d3f10a1688a947de3 AS builder

RUN xcaddy build --with github.com/caddy-dns/cloudflare

FROM caddy:2.9.1-alpine@sha256:b60636634fd2aebaf9460cf60997ad83aad6b139318d5713e2b78a60f52b139c

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
