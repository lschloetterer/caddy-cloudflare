FROM caddy:2.10.2-builder-alpine@sha256:dbf2f10a5eb99f7ae6d35e2dc533091a221a8b9b4eb10fc83b3f5bab49067337 AS builder

RUN xcaddy build --with github.com/caddy-dns/cloudflare

FROM caddy:2.10.2-alpine@sha256:953131cfea8e12bfe1c631a36308e9660e4389f0c3dfb3be957044d3ac92d446

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
