FROM caddy:2.10.0-builder-alpine@sha256:c13d4263c5866722b4603ac6430c5c0638edfbcde16ead9a9293f462ba6ec41e AS builder

RUN xcaddy build --with github.com/caddy-dns/cloudflare

FROM caddy:2.10.0-alpine@sha256:55ce1e7720af63164b96a8181cbf11dd64ea1bf1639852c5b5213344a5b204ae

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
