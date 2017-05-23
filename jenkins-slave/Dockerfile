FROM jenkinsci/jnlp-slave:3.7-1-alpine

USER root

RUN apk add --no-cache mongodb && \
    rm /usr/bin/mongoperf

RUN echo "@edge http://nl.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories && \
    apk update && \
    apk add curl "libpq@edge<9.7" "postgresql-client@edge<9.7" "postgresql@edge<9.7" "postgresql-contrib@edge<9.7" && \
    mkdir /docker-entrypoint-initdb.d && \
    curl -o /usr/local/bin/gosu -sSL "https://github.com/tianon/gosu/releases/download/1.2/gosu-amd64" && \
    chmod +x /usr/local/bin/gosu && \
    apk del curl && \
    rm -rf /var/cache/apk/*

ENV LANG=en_US.utf8 PGDATA=/var/lib/postgresql/data

VOLUME ["/var/lib/postgresql/data", "/data/db"]
EXPOSE 27017 28017 5432

ADD scripts/ /root/

ENTRYPOINT ["/root/docker-entrypoint.sh"]
