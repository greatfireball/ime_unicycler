ARG osversion=xenial
FROM ubuntu:${osversion}

ARG VERSION=master
ARG VCS_REF
ARG BUILD_DATE

RUN echo "VCS_REF: "${VCS_REF}", BUILD_DATE: "${BUILD_DATE}", VERSION: "${VERSION}

LABEL maintainer="frank.foerster@ime.fraunhofer.de" \
      description="Dockerfile providing the unicycler software" \
      version=${VERSION} \
      org.label-schema.vcs-ref=${VCS_REF} \
      org.label-schema.build-date=${BUILD_DATE} \
      org.label-schema.vcs-url="https://github.com/greatfireball/ime_unicycler.git"

RUN apt update && apt install --yes \
      wget \
      build-essential \
      git \
      zlib1g-dev \
      python3-setuptools \
      ncbi-blast+ \
      bowtie2 \
      openjdk-8-jre-headless \
      libncurses5-dev \
      libbz2-dev \
      liblzma-dev \
      python3

WORKDIR /opt
RUN wget -O spades.tar.gz \
        http://cab.spbu.ru/files/release3.13.0/SPAdes-3.13.0-Linux.tar.gz && \
    tar xvzf spades.tar.gz && \
    rm spades.tar.gz
ENV PATH=/opt/SPAdes-3.13.0-Linux/bin/:"$PATH"

RUN wget https://github.com/samtools/samtools/releases/download/1.4.1/samtools-1.4.1.tar.bz2 && \
    tar xjf samtools-1.4.1.tar.bz2 && \
    cd samtools-1.4.1 && \
    ./configure && \
    make && \
    make check && \
    make install && \
    cd .. && \
    rm -rf samtools-1.4.1 samtools-1.4.1.tar.bz2

RUN apt install --yes \
        mummer \
	python-numpy \
	python-matplotlib \
	time && \
    git clone --branch 0.5.0 https://github.com/isovic/racon.git racon && \
    cd racon && \
    make modules && \
    make tools && \
    make -j
ENV PATH=/opt/racon/bin/:"$PATH"

RUN mkdir pilon-1.22 && \
    cd pilon-1.22 && \
    wget https://github.com/broadinstitute/pilon/releases/download/v1.22/pilon-1.22.jar && \
    ln -s pilon-1.22.jar pilon.jar && \
    bash -c 'echo -e "#!/bin/bash\njava -Xmx128G -jar /opt/pilon-1.22/pilon.jar $@" > pilon' && \
    chmod +x pilon
ENV PATH=/opt/pilon-1.22/:"$PATH"

ENV PYTHONPATH=/opt/lib/python3.5/site-packages/
ENV PATH=/opt/bin/:"$PATH"
RUN git clone --branch v0.4.4 https://github.com/rrwick/Unicycler.git /opt/unicycler && \
    cd /opt/unicycler && \
    python3 setup.py install --prefix=/opt/

VOLUME /data
WORKDIR /data
