FROM cusspvz/node:4.0.0

# Docker-in-Docker for CI builds
# This should include all resources for a node-based project such as:
# - build utils
# - docker so we can build a docker image on CI
# - versioning software

ENV NODE_ENV=production
RUN apk --update upgrade && \
    apk add \
        make gcc g++ python linux-headers \
        docker iptables ca-certificates lxc e2fsprogs \
        git subversion \
    && \
    rm -fR /var/cache/apk/*

ADD https://raw.githubusercontent.com/jpetazzo/dind/master/wrapdocker /usr/local/bin/wrapdocker
RUN chmod +x /usr/local/bin/wrapdocker

VOLUME /var/lib/docker
CMD ["wrapdocker"]
