FROM debian:latest

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y make clang git \
    && git clone https://github.com/dstaley/FreeImage.git \
    && cd FreeImage \
    && CC=/usr/bin/clang CXX=/usr/bin/clang++ make \
    && make install

COPY . /grit
WORKDIR /grit

RUN CC=/usr/bin/clang CXX=/usr/bin/clang++ make