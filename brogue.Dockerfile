FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update -y \
    && apt-get install -y git make gcc libsdl2-2.0-0 libsdl2-dev \
    libsdl2-image-2.0-0 libsdl2-image-dev

RUN useradd -d /home/builder -m -s /bin/bash builder && echo "builder:builder" | chpasswd && adduser builder sudo
RUN mkdir -p /build
RUN chown -R builder:builder /build
USER builder

RUN mkdir -p /build/source
RUN mkdir -p /build/output

ARG VERSION=v1.11.1
ARG REPO=https://github.com/tmewett/BrogueCE.git

WORKDIR /build/source
RUN git clone ${REPO} .
RUN git checkout ${VERSION}

CMD make BrogueCE-linux && cp -r BrogueCE-linux/* /build/output
