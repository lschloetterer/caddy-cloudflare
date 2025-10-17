FROM caddy:2.10.2-builder-alpine@sha256:407924573f6ac35cd8859ee88e958628ccbad34481c53de31b9536f918d7de39 AS builder

RUN xcaddy build --with github.com/caddy-dns/cloudflare

FROM caddy:2.10.2-alpine@sha256:953131cfea8e12bfe1c631a36308e9660e4389f0c3dfb3be957044d3ac92d446

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
