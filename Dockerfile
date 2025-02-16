FROM caddy:2.9.1-builder-alpine@sha256:a7da868cc556e38e6003f7129db24c9a29ceceee9e2a4dfc46480e8b0ad7d4a2 AS builder

RUN xcaddy build --with github.com/caddy-dns/cloudflare

FROM caddy:2.9.1-alpine@sha256:b6894cfcec924873db96df564b7dabc2dee938c79d4d87c05fec463b18b63aa2

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
