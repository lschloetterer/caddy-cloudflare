FROM caddy:2.10.0-builder-alpine@sha256:cc6c40aa7cdea02ef9cb99f3c4e4664ecdb6066ae93ae52ed5288afc511e1241 AS builder

RUN xcaddy build --with github.com/caddy-dns/cloudflare

FROM caddy:2.10.0-alpine@sha256:ae4458638da8e1a91aafffb231c5f8778e964bca650c8a8cb23a7e8ac557aa3c

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
