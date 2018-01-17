FROM ubuntu:xenial

RUN apt update && apt install --yes \
      wget \
      build-essential \
      git

VOLUME /data
WORKDIR /data
