FROM alpine:3.7@sha256:8421d9a84432575381bfabd248f1eb56f3aa21d9d7cd2511583c68c9b7511d10

LABEL maintainer="Leonardo Gatica <lgatica@protonmail.com>" \
      caddy_version="0.10.12" \
      architecture="amd64"

ENV PORT=8000 CADDY_VERSION=0.10.12 CADDY_ARCHITECTURE=amd64

RUN apk add --no-cache openssh-client git tar curl

RUN curl --silent --show-error --fail --location \
      --header "Accept: application/tar+gzip, application/x-gzip, application/octet-stream" -o - \
      "https://github.com/mholt/caddy/releases/download/v${CADDY_VERSION}/caddy_v${CADDY_VERSION}_linux_${CADDY_ARCHITECTURE}.tar.gz" \
    | tar --no-same-owner -C /usr/bin -xz \
 && chmod 0755 /usr/bin/caddy \
 && /usr/bin/caddy -version

EXPOSE 80 443 2015
VOLUME /root/.caddy
WORKDIR /srv

COPY Caddyfile /etc/Caddyfile

ENTRYPOINT ["/usr/bin/caddy"]
CMD ["--conf", "/etc/Caddyfile", "--log", "stdout"]
