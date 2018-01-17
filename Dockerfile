FROM ubuntu:xenial

RUN apt update && apt install --yes \
      wget \
      build-essential \
      git \
      zlib1g-dev \
      python3-setuptools \
      ncbi-blast+ \
      bowtie2 \
      samtools \
      python3

RUN git clone https://github.com/rrwick/Unicycler.git /opt/unicycler && \
    cd /opt/unicycler && \
    python3 setup.py install

VOLUME /data
WORKDIR /data
