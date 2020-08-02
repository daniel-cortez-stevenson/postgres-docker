FROM ubuntu:bionic

RUN apt-get update -y && apt-get install -y \
    postgresql-client

ENTRYPOINT [ "psql" ]
