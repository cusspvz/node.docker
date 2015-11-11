FROM cusspvz/node:0.8.24

# development image specially created for builds
# This should include all resources for a node-based project such as:
# - build utils
# - docker so we can build a docker image on CI
# - versioning software

RUN wget -O /tmp/glibc.apk "https://circle-artifacts.com/gh/andyshinn/alpine-pkg-glibc/6/artifacts/0/home/ubuntu/alpine-pkg-glibc/packages/x86_64/glibc-2.21-r2.apk" && \
    apk add --allow-untrusted /tmp/glibc.apk && \
 	/usr/glibc/usr/bin/ldconfig /lib /usr/glibc/usr/lib && \
 	rm /tmp/glibc.apk

RUN apk --update upgrade && \
    apk add --force \
	bash wget curl bzip2 ca-certificates openssl \
        autoconf bison make gcc g++ python linux-headers \
	libffi-dev gdbm libyaml-dev@testing procps zlib-dev \
        docker@community iptables ca-certificates lxc e2fsprogs \
        git subversion \
    && \
    rm -fR /var/cache/apk/*

ADD https://raw.githubusercontent.com/jpetazzo/dind/master/wrapdocker /usr/local/bin/wrapdocker
RUN chmod +x /usr/local/bin/wrapdocker

VOLUME /var/lib/docker
CMD ["wrapdocker"]
