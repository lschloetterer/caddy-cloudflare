FROM caddy:2.9.1-builder-alpine@sha256:b16fde1b2d1373f96398778942d05c28d1fb9632023278f44f4c031cc66b1d2f AS builder

RUN xcaddy build --with github.com/caddy-dns/cloudflare

FROM caddy:2.9.1-alpine@sha256:b60636634fd2aebaf9460cf60997ad83aad6b139318d5713e2b78a60f52b139c

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
