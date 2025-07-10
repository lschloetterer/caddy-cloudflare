FROM caddy:2.10.0-builder-alpine@sha256:4c1f80296d9d9259ccb244ffbf20cb6fbdb1cf720f7fd592b1b30fd9317a129d AS builder

RUN xcaddy build --with github.com/caddy-dns/cloudflare

FROM caddy:2.10.0-alpine@sha256:e2e3a089760c453bc51c4e718342bd7032d6714f15b437db7121bfc2de2654a6

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
