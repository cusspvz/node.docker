FROM cusspvz/node:0.5.3

# For sugar automated builds
ONBUILD ENV NODE_ENV=production
ONBUILD ADD . /app
ONBUILD RUN \
    apk --update upgrade && \
    APK_NEEDS="make gcc g++ python linux-headers"; \
    apk add $APK_NEEDS && \
    npm install && \
    apk del $APK_NEEDS && \
    rm -fR /var/cache/apk/*

ONBUILD RUN npm run build
ONBUILD CMD [ "start" ]
