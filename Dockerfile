FROM caddy:2.10.0-builder-alpine@sha256:c13d4263c5866722b4603ac6430c5c0638edfbcde16ead9a9293f462ba6ec41e AS builder

RUN xcaddy build --with github.com/caddy-dns/cloudflare

FROM caddy:2.10.0-alpine@sha256:ae4458638da8e1a91aafffb231c5f8778e964bca650c8a8cb23a7e8ac557aa3c

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
