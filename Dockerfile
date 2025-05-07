FROM caddy:2.10.0-builder-alpine@sha256:83c0272b68761fa47e431b66dc3c4412e8cf419e107c5bc579d4d6e8f4652260 AS builder

RUN xcaddy build --with github.com/caddy-dns/cloudflare

FROM caddy:2.10.0-alpine@sha256:e2e3a089760c453bc51c4e718342bd7032d6714f15b437db7121bfc2de2654a6

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
