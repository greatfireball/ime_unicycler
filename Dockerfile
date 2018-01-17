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
      openjdk-8-jre-headless \
      python3

WORKDIR /opt
RUN wget -O spades.tar.gz \
        http://spades.bioinf.spbau.ru/release3.11.1/SPAdes-3.11.1-Linux.tar.gz && \
    tar xvzf spades.tar.gz && \
    rm spades.tar.gz
ENV PATH=/opt/SPAdes-3.11.1-Linux/bin/:"$PATH"


RUN git clone https://github.com/rrwick/Unicycler.git /opt/unicycler && \
    cd /opt/unicycler && \
    python3 setup.py install

VOLUME /data
WORKDIR /data
