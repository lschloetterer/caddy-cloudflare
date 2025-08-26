FROM caddy:2.10.2-builder-alpine@sha256:87e38b6488a6a512ce3bd143f66be7184aa7ac411b206815762b82db86ebd980 AS builder

RUN xcaddy build --with github.com/caddy-dns/cloudflare

FROM caddy:2.10.2-alpine@sha256:22ee08d42987c0fce9d9fe8922faed0d6f20cce5d464e8370dbab73b229af969

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
