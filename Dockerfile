FROM caddy:2.9.1-builder-alpine@sha256:c473c15a6761701625f62438b87fdc95d7f25a278e4df0043c4efc5ee092f4af AS builder

RUN xcaddy build --with github.com/caddy-dns/cloudflare

FROM caddy:2.9.1-alpine@sha256:b60636634fd2aebaf9460cf60997ad83aad6b139318d5713e2b78a60f52b139c

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
