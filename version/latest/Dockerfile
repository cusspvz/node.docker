FROM alpine:edge
MAINTAINER José Moreira <jose.moreira@findhit.com>

RUN apk add --update wget bash tar git libgcc libstdc++;
ENV NODE_PREFIX=/usr/local \
    NODE_VERSION=latest
RUN NODE_SOURCE="/usr/src/node"; \
    [ "${NODE_VERSION}" == "latest" ] && { \
        DOWNLOAD_PATH=https://nodejs.org/dist/node-latest.tar.gz; \
    } || { \
        DOWNLOAD_PATH=https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}.tar.gz; \
    }; \
    APK_NEEDS="make gcc g++ python linux-headers paxctl"; \
    apk add --update $APK_NEEDS && \
    mkdir -p $NODE_SOURCE && \
    wget --no-check-certificate -O - $DOWNLOAD_PATH -nv | tar -xz --strip-components=1 -C $NODE_SOURCE && \
    cd $NODE_SOURCE && \
    ./configure --prefix=$NODE_PREFIX && \
    make -j$(grep -c ^processor /proc/cpuinfo 2>/dev/null || 1) && \
    make install && \
    paxctl -cm ${NODE_PREFIX}/bin/node && \
    cd / && \
    apk del $APK_NEEDS && \
    rm -rf \
        ${NODE_SOURCE} \
        /etc/ssl \
        ${NODE_PREFIX}/include \
        ${NODE_PREFIX}/share/man \
        /tmp/* \
        /var/cache/apk/* \
        /root/.npm \
        /root/.node-gyp \
        ${NODE_PREFIX}/lib/node_modules/npm/man \
        ${NODE_PREFIX}/lib/node_modules/npm/doc \
        ${NODE_PREFIX}/lib/node_modules/npm/html \
    ; \
    mkdir -p /app;

WORKDIR /app
ADD https://raw.githubusercontent.com/cusspvz/node.docker/master/entrypoint /bin/entrypoint
RUN chmod +x /bin/entrypoint
ENTRYPOINT [ "/bin/entrypoint" ]
CMD [ "" ]
