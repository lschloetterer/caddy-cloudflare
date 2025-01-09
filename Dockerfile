FROM caddy:2.9.1-builder-alpine@sha256:bfa436d2711d1294501ba0f72f149d8c5dad237fc8e9c9b9aec682df8438ec73 AS builder

RUN xcaddy build --with github.com/caddy-dns/cloudflare

FROM caddy:2.9.1-alpine@sha256:eed289e78b2a0fa7d856b5d5aa9f0b39f727ab49c92f27986f1c03291c42f119

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
