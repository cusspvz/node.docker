FROM cusspvz/node:0.8.9

# For sugar automated builds
ONBUILD ENV NODE_ENV=production
ONBUILD ADD . /app
ONBUILD RUN npm install --production
ONBUILD RUN npm run build
ONBUILD CMD [ "start" ]
