FROM caddy:2.10.0-builder-alpine@sha256:1df07ddece81440960d630985847d6e50df8851766222ad8c1168324ef790457 AS builder

RUN xcaddy build --with github.com/caddy-dns/cloudflare

FROM caddy:2.10.0-alpine@sha256:ae4458638da8e1a91aafffb231c5f8778e964bca650c8a8cb23a7e8ac557aa3c

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
