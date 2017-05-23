FROM jenkinsci/jnlp-slave:3.7-1-alpine

USER root
WORKDIR /root

RUN echo "@edge http://nl.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories && \
    echo "@community http://dl-3.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
    apk update && \
    apk add curl "mongodb@community" "libpq@edge<9.7" "postgresql-client@edge<9.7" "postgresql@edge<9.7" "postgresql-contrib@edge<9.7" && \
    mkdir /docker-entrypoint-initdb.d && \
    curl -o /usr/local/bin/gosu -sSL "https://github.com/tianon/gosu/releases/download/1.2/gosu-amd64" && \
    chmod +x /usr/local/bin/gosu && \
    apk del curl && \
    rm -rf /var/cache/apk/* && \
    rm /usr/bin/mongoperf

ENV LANG en_US.utf8
ENV PGDATA /var/lib/postgresql/data

VOLUME ["/var/lib/postgresql/data", "/data/db"]
EXPOSE 27017 28017 5432

ADD scripts/ /root/scripts/
COPY scripts/run_postgres.sh /

ENTRYPOINT ["/root/scripts/docker-entrypoint.sh"]
