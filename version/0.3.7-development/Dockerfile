FROM cusspvz/node:0.3.7

# development image specially created for builds
# This should include all resources for a node-based project such as:
# - build utils
# - docker so we can build a docker image on CI
# - versioning software

RUN wget -O - --no-check-certificate "http://github.com/cusspvz/node.docker/raw/master/apks.tar.gz" | tar xvz -C /tmp && \
    apk add --allow-untrusted \
        /tmp/apks/glibc-2.21-r2.apk \
        /tmp/apks/glibc-bin-2.21-r2.apk \
    && \
    /usr/glibc/usr/bin/ldconfig /lib /usr/glibc/usr/lib && \
    rm -fR /tmp/apks && \
    echo "@testing http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    echo "@community http://nl.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
    apk update && \
    apk upgrade && \
    apk add \
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

ADD https://raw.githubusercontent.com/jpetazzo/dind/master/wrapdocker /usr/local/bin/wrapdocker
RUN chmod +x /usr/local/bin/wrapdocker

VOLUME /var/lib/docker
CMD ["wrapdocker"]
