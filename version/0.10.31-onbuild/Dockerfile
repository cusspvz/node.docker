FROM cusspvz/node:0.10.31

# For sugar automated builds
ONBUILD ENV NODE_ENV=production
ONBUILD ADD . /app
ONBUILD RUN APK_NEEDS="make gcc g++ python linux-headers"; \
    apk --update add $APK_NEEDS && \
    npm install && \
    apk del $APK_NEEDS && \
    rm -fR /var/cache/apk/*
ONBUILD RUN npm run build
ONBUILD CMD [ "start" ]
