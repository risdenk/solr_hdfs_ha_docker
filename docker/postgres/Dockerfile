FROM postgres:9.6-alpine

RUN apk --no-cache add openssl ca-certificates wget && update-ca-certificates

COPY Ambari-DDL-Postgres-CREATE.sql /tmp/Ambari-DDL-Postgres-CREATE.sql 

COPY init-user-db.sh /docker-entrypoint-initdb.d/init-user-db.sh

