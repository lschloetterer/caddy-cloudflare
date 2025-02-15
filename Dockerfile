FROM caddy:2.9.1-builder-alpine@sha256:77a6376a7f8074e856ffdb339054d28b93bd6cc68c82e34b675b0b39b1a25689 AS builder

RUN xcaddy build --with github.com/caddy-dns/cloudflare

FROM caddy:2.9.1-alpine@sha256:b1843ebe13997299e8639d208f1b94e5d849dd0f31047652e62ab56b1ec881a9

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
