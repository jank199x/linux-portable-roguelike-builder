FROM fedora:35

RUN dnf install -y git gcc gcc-c++ make bison flex ncurses-devel compat-lua-devel \
    sqlite-devel zlib-devel pkgconfig python3-yaml \
    #
    SDL2-devel SDL2_image-devel libpng-devel freetype-devel \
    dejavu-sans-fonts dejavu-sans-mono-fonts advancecomp pngcrush \
    # 
    which mesa-libGLU-devel

RUN useradd -d /home/builder -m -s /bin/bash builder \
    && echo "builder:builder" | chpasswd \
    && usermod -a -G wheel builder
RUN mkdir -p /build
RUN chown -R builder:builder /build
RUN chown -R builder:builder /opt
USER builder

RUN mkdir -p /build/source
RUN mkdir -p /build/output

ARG REPO=https://github.com/b-crawl/bcrawl.git
ARG VERSION=bcrawl-1.36.3

WORKDIR /build/source
RUN git clone ${REPO} .
RUN git submodule update --init
RUN git checkout ${VERSION}

WORKDIR /build/source/crawl-ref/source
CMD make -j4 TILES=y \
    && cp -r /build/source/crawl-ref/source/dat /build/output/ \
    && cp /build/source/crawl-ref/source/crawl /build/output/crawl-tiles \
    && cp -r /build/source/crawl-ref/settings /build/output/ \
    && cp -r /build/source/crawl-ref/docs /build/output/ \
    && mkdir /build/output/contrib \
    && cp -r /build/source/crawl-ref/source/contrib/fonts /build/output/contrib/

