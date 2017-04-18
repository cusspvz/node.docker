FROM alpine:3.4
MAINTAINER José Moreira <jose.moreira@findhit.com>

ENV NODE_PREFIX=/usr/local \
    NODE_VERSION=latest \
    NPM_VERSION=latest \
    YARN_VERSION=latest \
    NODE_SOURCE=/usr/src/node \
    BASE_APKS="bash libgcc libstdc++ openssl ca-certificates" \
    BUILD_APKS="git curl wget bzip2 tar make gcc clang g++ python linux-headers paxctl binutils-gold autoconf bison zlib-dev openssl-dev" \
    NODE_CONFIG_FLAGS="--shared-openssl"

RUN [ "${NODE_VERSION}" == "latest" ] && { \
        DOWNLOAD_PATH=https://nodejs.org/dist/node-latest.tar.gz; \
    } || { \
        DOWNLOAD_PATH=https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}.tar.gz; \
    }; \
    apk add --update $BASE_APKS $BUILD_APKS && \
    mkdir -p $NODE_SOURCE && \
    wget -O - $DOWNLOAD_PATH -nv | tar -xz --strip-components=1 -C $NODE_SOURCE && \
    cd $NODE_SOURCE && \
    export GYP_DEFINES="linux_use_gold_flags=0" && \
    ./configure --prefix=$NODE_PREFIX $NODE_CONFIG_FLAGS && \
    make -j$(grep -c ^processor /proc/cpuinfo 2>/dev/null || 1) && \
    make install && \
    paxctl -cm ${NODE_PREFIX}/bin/node && \
    cd / && \
    if [ -x /usr/bin/npm ]; then \
      npm install -g npm@${NPM_VERSION} yarn@${YARN_VERSION} && \
      find /usr/lib/node_modules/npm -name test -o -name .bin -type d | xargs rm -rf; \
    fi && \
    apk del $BUILD_APKS && \
    rm -rf \
        ${NODE_SOURCE} \
        /etc/ssl \
        ${NODE_PREFIX}/include \
        ${NODE_PREFIX}/share/man \
        /tmp/* \
        /var/cache/apk/* \
        /root/.npm \
        /root/.node-gyp \
        /root/.gnupg \
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
