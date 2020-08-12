FROM debian:buster-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN addgroup --system --gid 101 nginx && \
    adduser --system --disabled-login --ingroup nginx --no-create-home --home /nonexistent --gecos "nginx user" --shell /bin/false --uid 101 nginx && \
    apt update && \
    apt-get install --no-install-recommends --no-install-suggests -y apache2-utils gettext-base nginx nginx-extras && \
    rm -rf /var/lib/apt/lists/* && \
    ln -sf /dev/stderr /var/log/nginx/error.log && \
    rm /etc/nginx/sites-enabled/*

ADD webdav.conf.template /etc/nginx/conf.d/webdav.conf.template

COPY entrypoint.sh /

EXPOSE 80

CMD /entrypoint.sh
