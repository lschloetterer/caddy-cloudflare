FROM caddy:2.9.1-builder-alpine@sha256:a04392749efef26d61092b72ce362959e94010b95d4ffaef7099fd1e09e03932 AS builder

RUN xcaddy build --with github.com/caddy-dns/cloudflare

FROM caddy:2.9.1-alpine@sha256:b60636634fd2aebaf9460cf60997ad83aad6b139318d5713e2b78a60f52b139c

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
