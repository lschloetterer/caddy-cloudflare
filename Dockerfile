FROM caddy:2.10.0-builder-alpine@sha256:3548087c3e7ecaac874989ab376b9232a7af4a7ef8a1df4f9081be851a4c74e6 AS builder

RUN xcaddy build --with github.com/caddy-dns/cloudflare

FROM caddy:2.10.0-alpine@sha256:e2e3a089760c453bc51c4e718342bd7032d6714f15b437db7121bfc2de2654a6

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
