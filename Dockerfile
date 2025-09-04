FROM caddy:2.10.2-builder-alpine@sha256:c022cdea05ece8f63affe520afeca68fb76f70a78a77d808a8f55861d2ae089c AS builder

RUN xcaddy build --with github.com/caddy-dns/cloudflare

FROM caddy:2.10.2-alpine@sha256:a4180db0805b3725ddf936d2e6290553745c7339c003565da717ee612fd8a888

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
