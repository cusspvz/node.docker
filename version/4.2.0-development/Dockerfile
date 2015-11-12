FROM cusspvz/node:4.2.0

# development image specially created for builds
# This should include all resources for a node-based project such as:
# - build utils
# - docker so we can build a docker image on CI
# - versioning software

# Upgrade image before doing stuff
RUN apk --update upgrade && \
    rm -fR /var/cache/apk/*

# glibc for alpine
RUN wget -O - --no-check-certificate "http://github.com/cusspvz/node.docker/raw/master/apks.tar.gz" | tar xvz -C /tmp && \
    apk add --allow-untrusted \
        /tmp/apks/glibc-2.21-r2.apk \
        /tmp/apks/glibc-bin-2.21-r2.apk \
    && \
    /usr/glibc/usr/bin/ldconfig /lib /usr/glibc/usr/lib && \
    rm -fR /tmp/apks /var/cache/apk/*

# Stuff that could be gathered through alpine package manager
RUN echo "@testing http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    echo "@community http://nl.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
    apk --update add \
        bash wget curl bzip2 ca-certificates openssl \
        autoconf bison make gcc g++ python linux-headers \
        libffi-dev gdbm libyaml-dev@testing procps zlib-dev \
        docker@community iptables ca-certificates lxc e2fsprogs \
        git subversion \
    && \
    rm -f /bin/ash /bin/sh && \
    ln -s /bin/bash /bin/ash && \
    ln -s /bin/bash /bin/sh && \
    rm -fR /var/cache/apk/*

# Docker compose
RUN DOCKER_COMPOSE_URL="http://github.com$(wget -O - --no-check-certificate https://github.com/docker/compose/releases/latest | egrep -o '/docker/compose/releases/download/[0-9.]*/docker-compose-Linux-x86_64')"; \
    echo $DOCKER_COMPOSE_URL && \
    wget -O /usr/bin/docker-compose --no-check-certificate "$DOCKER_COMPOSE_URL" && \
    chmod +x /usr/bin/docker-compose && \
    /usr/bin/docker-compose --version

# Rancher compose
RUN RANCHER_COMPOSE_URL="http://github.com$(wget -O - --no-check-certificate https://github.com/rancher/rancher-compose/releases/latest | egrep -o '/rancher/rancher-compose/releases/download/v[0-9.]*/rancher-compose-linux-amd64-v[0-9.]*.tar.gz')"; \
    echo $RANCHER_COMPOSE_URL && \
    wget -O - --no-check-certificate "$RANCHER_COMPOSE_URL" | \
    tar xvz --strip-components=2 -C /usr/bin/ && \
    chmod +x /usr/bin/rancher-compose && \
    /usr/bin/rancher-compose --version

ADD https://raw.githubusercontent.com/jpetazzo/dind/master/wrapdocker /usr/local/bin/wrapdocker
RUN chmod +x /usr/local/bin/wrapdocker

VOLUME /var/lib/docker
CMD ["wrapdocker"]
