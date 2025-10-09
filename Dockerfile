FROM caddy:2.10.2-builder-alpine@sha256:a2bd1100fec0276f96598a4f46efecd4f2a822d5cec66c3a8f9384c7fe32c91d AS builder

RUN xcaddy build --with github.com/caddy-dns/cloudflare

FROM caddy:2.10.2-alpine@sha256:c94c06446b916bf8153f5128825acf7747205ecf815b3bacd27027ef5ad2f13a

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
