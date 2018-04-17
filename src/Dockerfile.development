
# development image specially created for builds
# This should include all resources for a node-based project such as:
# - build utils
# - docker so we can build a docker image on CI
# - versioning software

# Stuff that could be gathered through alpine package manager
RUN rm -f /etc/apk/repositories && \
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories && \
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
    apk update && apk upgrade && \
    apk add \
        $BUILD_APKS \
        imagemagick graphicsmagick vips-dev fftw-dev libjpeg-turbo-dev jpeg-dev \
        libffi-dev gdbm yaml-dev procps \
        docker iptables lxc e2fsprogs \
        subversion \
        jq \
    && \
    mkdir -p /etc/ssl/certs/ && \
    update-ca-certificates --fresh && \
    rm -f /bin/ash /bin/sh && \
    ln -s /bin/bash /bin/ash && \
    ln -s /bin/bash /bin/sh && \
    rm -fR /var/cache/apk/*

# glibc for alpine
RUN wget -O - "https://github.com/cusspvz/node.docker/raw/master/apks.tar.gz" | tar xvz -C /tmp && \
    apk add --force --allow-untrusted \
        /tmp/apks/glibc-2.21-r2.apk \
        /tmp/apks/glibc-bin-2.21-r2.apk \
    && \
    /usr/glibc/usr/bin/ldconfig /lib /usr/glibc/usr/lib && \
    rm -fR /tmp/apks /var/cache/apk/*

# Docker compose
RUN wget -O /usr/bin/docker-compose $(curl -s https://api.github.com/repos/docker/compose/releases/latest | jq --raw-output '[ .assets[] | .browser_download_url | if match("Linux-x86_64") then tostring else "" end ] | .[0]') && \
    chmod +x /usr/bin/docker-compose && \
    /usr/bin/docker-compose --version

# Rancher compose
RUN wget -O - $(curl -s https://api.github.com/repos/rancher/rancher-compose/releases/latest | jq --raw-output '[ .assets[] | .browser_download_url | if match("linux-amd64") then tostring else "" end ] | .[0]') | \
    tar xvz --strip-components=2 -C /usr/bin/ && \
    chmod +x /usr/bin/rancher-compose && \
    /usr/bin/rancher-compose --version

ADD https://raw.githubusercontent.com/jpetazzo/dind/master/wrapdocker /usr/local/bin/wrapdocker
RUN chmod +x /usr/local/bin/wrapdocker

VOLUME /var/lib/docker
CMD ["wrapdocker"]
