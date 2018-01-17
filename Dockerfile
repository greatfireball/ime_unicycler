FROM ubuntu:xenial

RUN apt update && apt install --yes \
      wget \
      build-essential \
      git \
      python3

RUN git clone https://github.com/rrwick/Unicycler.git /opt/unicycler && \
    cd /opt/unicycler && \
    python3 setup.py install

VOLUME /data
WORKDIR /data
