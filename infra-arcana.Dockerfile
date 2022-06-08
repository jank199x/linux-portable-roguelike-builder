FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update -y \
    && apt-get install -y git build-essential cmake \
    libsdl2-2.0-0 libsdl2-dev libsdl2-image-dev libsdl2-mixer-dev

RUN useradd -d /home/builder -m -s /bin/bash builder && echo "builder:builder" | chpasswd && adduser builder sudo
RUN mkdir -p /build
RUN chown -R builder:builder /build
USER builder

RUN mkdir -p /build/source
RUN mkdir -p /build/output

ARG VERSION
ARG REPO

WORKDIR /build/source
RUN git clone ${REPO} .
RUN git checkout ${VERSION}

RUN mkdir -p /build/source/build
WORKDIR /build/source/build
CMD cmake ../ && make ia && cp -r /build/source/build/* /build/output/ \
    && cd /build/output \
    && rm -rf CMakeFiles cmake_install.cmake CMakeCache.txt \
    compile_commands.json CTestTestfile.cmake Makefile