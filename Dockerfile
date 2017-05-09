FROM node:7.9.0-slim

RUN apt-get update; apt-get upgrade -y; \
    apt-get install -y \
    make \
    gcc \
    g++ \
    git \
    curl \
    expect \
    openvpn \
    screen \
    mediainfo \
    zlib1g-dev \
    libssl-dev \
    libncurses5-dev \
    libcurl4-openssl-dev \
    pkg-config

ARG LIBTORRENT=libtorrent-0.13.6 
ARG RTORRENT=rtorrent-0.9.6 

RUN cd /tmp; \
    git clone https://github.com/mirror/xmlrpc-c.git /tmp/xmlrpc; \
    curl http://rtorrent.net/downloads/${LIBTORRENT}.tar.gz | tar xz; \
    curl http://rtorrent.net/downloads/${RTORRENT}.tar.gz  | tar xz; \
    cd /tmp/${LIBTORRENT}; \
    ./configure; \
    make; \
    make install; \
    cd /tmp/xmlrpc/stable; \
    ./configure; \
    make; \
    make install; \
    cd /tmp/${RTORRENT}; \
    ./configure --with-xmlrpc-c; \
    make; \
    make install

RUN git clone https://github.com/jfurrow/flood.git /flood; \
    cd /flood; \
    npm install --production; \
    ldconfig

RUN apt-get remove --purge -y \
    git \
    gcc \
    g++ \
    make \
    && apt-get autoremove -y \
    && rm -fr /tmp/xmlrpc /tmp/${LIBTORRENT} /tmp/${RTORRENT}

ENV UID=0 \
    GID=0 

COPY ./import/rtorrent.rc /tmp/.rtorrent.rc
COPY ./import/config.js /flood/config.js
COPY ./scripts /scripts/

EXPOSE 3000 49876 49876/udp

VOLUME /data /config

CMD ["sh", "/scripts/start.sh"]
