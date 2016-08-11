FROM alpine:3.4
MAINTAINER José Moreira <jose.moreira@findhit.com>

RUN apk add --update wget bash tar git libgcc libstdc++ openssl;
ENV NODE_PREFIX=/usr/local \
    NODE_VERSION=0.9.12
RUN NODE_SOURCE="/usr/src/node"; \
    [ "${NODE_VERSION}" == "latest" ] && { \
        DOWNLOAD_PATH=https://nodejs.org/dist/node-latest.tar.gz; \
    } || { \
        DOWNLOAD_PATH=https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}.tar.gz; \
    }; \
    BUILD_NEEDS="make gcc clang g++ python linux-headers paxctl binutils-gold openssl-dev"; \
    apk add --update $BUILD_NEEDS && \
    mkdir -p $NODE_SOURCE && \
    wget --no-check-certificate -O - $DOWNLOAD_PATH -nv | tar -xz --strip-components=1 -C $NODE_SOURCE && \
    cd $NODE_SOURCE && \
    ./configure --prefix=$NODE_PREFIX && \
    make -j$(grep -c ^processor /proc/cpuinfo 2>/dev/null || 1) && \
    make install && \
    paxctl -cm ${NODE_PREFIX}/bin/node && \
    cd / && \
    apk del $BUILD_NEEDS && \
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
    && \
    mkdir -p /app && \
    exit 0 || exit 1;

WORKDIR /app
ADD https://raw.githubusercontent.com/cusspvz/node.docker/master/src/entrypoint /bin/entrypoint
RUN chmod +x /bin/entrypoint
ENTRYPOINT [ "/bin/entrypoint" ]
CMD [ "" ]
