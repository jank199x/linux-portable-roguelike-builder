FROM fedora:35

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update -y \
    && apt-get install -y git build-essential libncursesw5-dev bison flex liblua5.1-0-dev \
    libsqlite3-dev libz-dev pkg-config python3-yaml binutils-gold \
    libsdl2-image-dev libsdl2-mixer-dev libsdl2-dev \
    libfreetype6-dev libpng-dev fonts-dejavu-core advancecomp pngcrush

RUN useradd -d /home/builder -m -s /bin/bash builder && echo "builder:builder" | chpasswd && adduser builder sudo
RUN mkdir -p /build
RUN chown -R builder:builder /build
RUN chown -R builder:builder /opt
USER builder

RUN mkdir -p /build/source
RUN mkdir -p /build/output

ENV VERSION bcrawl-1.36.3
ENV REPO https://github.com/b-crawl/bcrawl.git

WORKDIR /build/source
RUN git clone ${REPO} .
RUN git checkout ${VERSION}

RUN git submodule update --init

RUN mkdir -p /opt/games/bcrawl

WORKDIR /build/source/crawl-ref/source
CMD make install -j4 TILES=y prefix=/opt/games/bcrawl DATADIR=data/ SAVEDIR=saves/ \
    && cp -r /opt/games/bcrawl/* /build/output
