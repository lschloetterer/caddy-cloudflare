FROM caddy:2.11.8-builder-alpine@sha256:661f29bb0de2c3ea5eb9cae5783e1c907ef7daa13a4b7db5207c710f51854e4a AS builder

RUN xcaddy build --with github.com/caddy-dns/cloudflare

FROM caddy:2.11.8-alpine@sha256:3db3a09e418f86a8fce8de4bc0026fccd2b4cd925aef00cc7d843d9fdc75e442

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
