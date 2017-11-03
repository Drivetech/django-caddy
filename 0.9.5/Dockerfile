FROM alpine:3.5@sha256:b007a354427e1880de9cdba533e8e57382b7f2853a68a478a17d447b302c219c

LABEL maintainer="Leonardo Gatica <lgatica@protonmail.com>" \
      caddy_version="0.9.5" \
      architecture="amd64"

ENV PORT 8000

RUN apk add --no-cache openssh-client git tar curl

RUN curl --silent --show-error --fail --location \
      --header "Accept: application/tar+gzip, application/x-gzip, application/octet-stream" -o - \
      "https://github.com/mholt/caddy/releases/download/v0.9.5/caddy_linux_amd64.tar.gz" \
    | tar --no-same-owner -C /usr/bin -xz \
 && mv /usr/bin/caddy_linux_amd64 /usr/bin/caddy \
 && chmod 0755 /usr/bin/caddy \
 && /usr/bin/caddy -version

EXPOSE 80 443 2015
VOLUME /root/.caddy
WORKDIR /srv

COPY Caddyfile /etc/Caddyfile

ENTRYPOINT ["/usr/bin/caddy"]
CMD ["--conf", "/etc/Caddyfile", "--log", "stdout"]
