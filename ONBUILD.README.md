# cuss.pvz/node Docker Image

This image supports sugar onbuild, meaning that your Dockerfile could be super
hyper simple (as one-line), unless you need to install things into linux system.
Suff related directly with `npm` and your app, should stay at `package.json`.


## Brief onbuild example

`package.json`
```json
{
    "name": "my-awesome-app",
    "version": "1.0.3",
    "scripts": {
        "build": "browserify app/index.js > build/index.js",
        "start": "node serve.js /build"
    }
}
```

`Dockerfile`
```Dockerfile
FROM cusspvz/node:0.12.7-onbuild
EXPOSE 3000 # You may need to change this to your app's port
```

`docker build -t my-awesome-app:1.0.3 .` will build a production-ready image by
installing all needed dependencies and linking things together.

## How does `onbuild` works?

Under the hood, it executes the following commands:
* `ENV NODE_ENV=production` - This sets `NODE_ENV` as production so you can pull
  already the generated image into your servers! :)
* `ADD . /` - This will copy all files and folders present on `Dockerfile`
  directory into docker image. If you want this to ignore some files, just
  create `.dockerignore` and place there ignore rules.
* `npm install --production` - Installs only production needed packages
  dependencies. If you need some of the development packages, use next command
  to install them. Please be sure you left your image clean and small.
* `npm run build` - You should **ALWAYS** have a `build` script. Most of us will
  need this to set up our building process, if you don't, just set it up as an
  `echo none`. In case you don't know what to put here, for us, this is useful
  for building front-end components at our projects.
* `CMD [ "start" ]` - I've put here an `entrypoint` that has the following
  behaviors:
  * ` ` - If nothing is supplied, it will just exec `node`
  * `start` (Default) - proxies `npm start` so your app could run
  * `shell` - proxies to `/bin/sh`

## What if i need to install stuff on my container?

Where are two ways of doing this. If packages aren't direct dependencies to your
app, you could continue to use `onbuild` version. Otherwise, if you `onbuild` is
failing because `npm install` declares the needs of some dependencies, you will
have to use regular version.

### onbuild way:
```Dockerfile
FROM cusspvz/node:0.12.7-onbuild
RUN apk --update add package-a package-b && \
    rm -fR /var/cache/apk/*;
```

### regular way:
```Dockerfile
FROM cusspvz/node:0.12.7
RUN apk --update add package-a package-b && \
    rm -fR /var/cache/apk/*;

ENV NODE_ENV=production
ADD . /app

RUN npm install --production
RUN npm run build

CMD [ "start" ]
```

## Wait, what the f*ck is `apk`?

`apk` is the package manager for [Alpine Linux](//alpinelinux.org/) which this image is based.

Its similar to:
* `apt-get` on `.deb` based distros (Debian, Ubuntu, etc)
* `yum` on `.rpm` based distros (CentOS, Fedora, etc)
* `npm` on... ok, not quite but you got the idea.

## And how do I know packages names?

[Alpine Linux](//alpinelinux.org/), like many other distros, keeps a [page](//pkgs.alpinelinux.org/packages) with all info and links
for each package.

## Seems nice!! I'm gona use it on my next project!

Cool!! Rate and tweet [GitHub repo](//github.com/cusspvz/node.docker) so others can know about this.

## What if I want to access and execute some shitty shell things?

```bash
docker run --rm -ti cusspvz/node:0.12.7 shell
```
