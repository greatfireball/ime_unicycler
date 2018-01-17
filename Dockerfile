FROM ubuntu:xenial

RUN apt update && apt install --yes \
      wget \
      build-essential \
      git \
      python3


VOLUME /data
WORKDIR /data
