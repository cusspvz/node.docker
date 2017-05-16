
# For sugar automated builds
ONBUILD ENV NODE_ENV=production
ONBUILD ADD . /app
ONBUILD RUN \
    echo ""                                                                     && \
    echo "# Welcome to cusspvz/node onbuild-yarn!"                              && \
    echo ""                                                                     && \
    echo "Here are a few notes you must know:"                                  && \
    echo " - preinstall script: Set preinstall script on your package.json in"  && \
    echo "   case you need extra linux packages."                               && \
    echo '     Example: "preinstall": "apk add perl" '                          && \
    echo " - postinstall script: Set postinstall script on your package.json"   && \
    echo "   if you need to do some cleaning, like a removal of a package you"  && \
    echo "   only installed for building."                                      && \
    echo '     Example: "preinstall": "apk del perl" '                          && \
    echo " - build script: Always set a build script on your package.json even" && \
    echo "   if you do NOT need it, but probably you'll need."                  && \
    echo '     Example: "postinstall": "grunt build" '                          && \
    echo " - start script: Always set start script on your package.json so the" && \
    echo "   docker image knows what to run whenever it starts."                && \
    echo '     Example: "start": "node build/server/index.js" '                 && \
    echo ""                                                                     && \
    echo "Thanks for using it and spread the word,"                             && \
    echo "José Moreira (@cusspvz)"                                              && \
    echo ""                                                                     && \
    echo "--"                                                                   && \
    apk --update add $BUILD_APKS && \
        yarn install && \
    apk del $BUILD_APKS && \
    rm -fR /var/cache/apk/*

ONBUILD CMD [ "start" ]
