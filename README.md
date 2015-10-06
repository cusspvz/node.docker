# cusspvz/node

🌐Super small Node.js container (~20MB) based on Alpine Linux OS

## Usage

### Running node interpreter
```bash
josemoreira@MacBook-Pro-de-JM ~/G/c/node.docker> docker run --rm -ti cusspvz/node:0.12.7
> console.log("yOLO")
yOLO
undefined
>
```

### Using as base image

This image supports sugar onbuild, meaning that your Dockerfile could be super
hyper simple (as one-line), unless you need to install things into linux system.
Suff related directly with `npm` and your app, should stay at `package.json`.


#### Brief onbuild example

`package.json`
```json
{
    "name": "my-awesome-app",
    "version": "1.0.3",
    "scripts": {
        "build": "echo \"console.log( window )\" > build/index.js",
        "start": "node serve.js /build"
    }
}
```

`Dockerfile`
```Dockerfile
FROM cusspvz/node:0.12.7-onbuild
```

`docker build -t my-awesome-app:1.0.3 .` will build a production-ready image by
installing all needed dependencies and linking things together.

#### How does `onbuild` works?

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

#### What if i need to install stuff on my container?

Where are two ways of doing this. If packages aren't direct dependencies to your
app, you could continue to use `onbuild` version. Otherwise, if you `onbuild` is
failing because `npm install` declares the needs of some dependencies, you will
have to use regular version.

##### onbuild way:
```Dockerfile
FROM cusspvz/node:0.12.7-onbuild
RUN apk --update add package-a package-b && \
    rm -fR /var/cache/apk/*;
```

##### regular way:
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

#### Wait, what the f*ck is `apk`?

`apk` is the package manager for [Alpine Linux](//alpinelinux.org/) which this image is based.

Its similar to:
* `apt-get` on `.deb` based distros (Debian, Ubuntu, etc)
* `yum` on `.rpm` based distros (CentOS, Fedora, etc)
* `npm` on... ok, not quite but you got the idea.

#### And how do I know packages names?

[Alpine Linux](//alpinelinux.org/), like many other distros, keeps a [page](//pkgs.alpinelinux.org/packages) with all info and links
for each package.

#### Seems nice!! I'm gona use it on my next project!

Cool!! Rate and tweet [GitHub repo](//github.com/cusspvz/node.docker) so others can know about this.

## Versions

~~I'm building images on my computer, as so, versions won't be available since I
have to check/build one by one.~~

Created `make VERSION=xxx gen-version` to create/update Dockerfile's for each
version so I can use Docker Hub builder instead. That doesn't mean that all
versions are working, as so, this list will be kept to be updated.

:white_check_mark: - Built and working

Others aren't built, or are presenting errors.

* :white_check_mark: 4.1.2 - `cusspvz/node:4.1.2` `cusspvz/node:4.1.2-onbuild`
* :white_check_mark: 4.1.1 - `cusspvz/node:4.1.1` `cusspvz/node:4.1.1-onbuild`
* :white_check_mark: 4.1.0 - `cusspvz/node:4.1.0` `cusspvz/node:4.1.0-onbuild`
* :white_check_mark: 4.0.0 - `cusspvz/node:4.0.0` `cusspvz/node:4.0.0-onbuild`
* :white_check_mark: 0.12.7 - `cusspvz/node:0.12.7` `cusspvz/node:0.12.7-onbuild`
* :white_check_mark: 0.12.6 - `cusspvz/node:0.12.6` `cusspvz/node:0.12.6-onbuild`
* :white_check_mark: 0.12.5 - `cusspvz/node:0.12.5` `cusspvz/node:0.12.5-onbuild`
* :white_check_mark: 0.12.4 - `cusspvz/node:0.12.4` `cusspvz/node:0.12.4-onbuild`
* :white_check_mark: 0.12.3 - `cusspvz/node:0.12.3` `cusspvz/node:0.12.3-onbuild`
* :white_check_mark: 0.12.2 - `cusspvz/node:0.12.2` `cusspvz/node:0.12.2-onbuild`
* :white_check_mark: 0.12.1 - `cusspvz/node:0.12.1` `cusspvz/node:0.12.1-onbuild`
* ~~0.12.0 - `cusspvz/node:0.12.0` `cusspvz/node:0.12.0-onbuild`~~
* ~~0.11.16 - `cusspvz/node:0.11.16` `cusspvz/node:0.11.16-onbuild`~~
* ~~0.11.15 - `cusspvz/node:0.11.15` `cusspvz/node:0.11.15-onbuild`~~
* ~~0.11.14 - `cusspvz/node:0.11.14` `cusspvz/node:0.11.14-onbuild`~~
* ~~0.11.13 - `cusspvz/node:0.11.13` `cusspvz/node:0.11.13-onbuild`~~
* ~~0.11.12 - `cusspvz/node:0.11.12` `cusspvz/node:0.11.12-onbuild`~~
* ~~0.11.11 - `cusspvz/node:0.11.11` `cusspvz/node:0.11.11-onbuild`~~
* ~~0.11.10 - `cusspvz/node:0.11.10` `cusspvz/node:0.11.10-onbuild`~~
* ~~0.11.9 - `cusspvz/node:0.11.9` `cusspvz/node:0.11.9-onbuild`~~
* ~~0.11.8 - `cusspvz/node:0.11.8` `cusspvz/node:0.11.8-onbuild`~~
* ~~0.11.7 - `cusspvz/node:0.11.7` `cusspvz/node:0.11.7-onbuild`~~
* ~~0.11.6 - `cusspvz/node:0.11.6` `cusspvz/node:0.11.6-onbuild`~~
* ~~0.11.5 - `cusspvz/node:0.11.5` `cusspvz/node:0.11.5-onbuild`~~
* ~~0.11.4 - `cusspvz/node:0.11.4` `cusspvz/node:0.11.4-onbuild`~~
* ~~0.11.3 - `cusspvz/node:0.11.3` `cusspvz/node:0.11.3-onbuild`~~
* ~~0.11.2 - `cusspvz/node:0.11.2` `cusspvz/node:0.11.2-onbuild`~~
* ~~0.11.1 - `cusspvz/node:0.11.1` `cusspvz/node:0.11.1-onbuild`~~
* ~~0.11.0 - `cusspvz/node:0.11.0` `cusspvz/node:0.11.0-onbuild`~~
* ~~0.10.40 - `cusspvz/node:0.10.40` `cusspvz/node:0.10.40-onbuild`~~
* ~~0.10.39 - `cusspvz/node:0.10.39` `cusspvz/node:0.10.39-onbuild`~~
* ~~0.10.38 - `cusspvz/node:0.10.38` `cusspvz/node:0.10.38-onbuild`~~
* ~~0.10.37 - `cusspvz/node:0.10.37` `cusspvz/node:0.10.37-onbuild`~~
* ~~0.10.36 - `cusspvz/node:0.10.36` `cusspvz/node:0.10.36-onbuild`~~
* ~~0.10.35 - `cusspvz/node:0.10.35` `cusspvz/node:0.10.35-onbuild`~~
* ~~0.10.34 - `cusspvz/node:0.10.34` `cusspvz/node:0.10.34-onbuild`~~
* ~~0.10.33 - `cusspvz/node:0.10.33` `cusspvz/node:0.10.33-onbuild`~~
* ~~0.10.32 - `cusspvz/node:0.10.32` `cusspvz/node:0.10.32-onbuild`~~
* ~~0.10.31 - `cusspvz/node:0.10.31` `cusspvz/node:0.10.31-onbuild`~~
* ~~0.10.30 - `cusspvz/node:0.10.30` `cusspvz/node:0.10.30-onbuild`~~
* ~~0.10.29 - `cusspvz/node:0.10.29` `cusspvz/node:0.10.29-onbuild`~~
* ~~0.10.28 - `cusspvz/node:0.10.28` `cusspvz/node:0.10.28-onbuild`~~
* ~~0.10.27 - `cusspvz/node:0.10.27` `cusspvz/node:0.10.27-onbuild`~~
* ~~0.10.26 - `cusspvz/node:0.10.26` `cusspvz/node:0.10.26-onbuild`~~
* ~~0.10.25 - `cusspvz/node:0.10.25` `cusspvz/node:0.10.25-onbuild`~~
* ~~0.10.24 - `cusspvz/node:0.10.24` `cusspvz/node:0.10.24-onbuild`~~
* ~~0.10.23 - `cusspvz/node:0.10.23` `cusspvz/node:0.10.23-onbuild`~~
* ~~0.10.22 - `cusspvz/node:0.10.22` `cusspvz/node:0.10.22-onbuild`~~
* ~~0.10.21 - `cusspvz/node:0.10.21` `cusspvz/node:0.10.21-onbuild`~~
* ~~0.10.20 - `cusspvz/node:0.10.20` `cusspvz/node:0.10.20-onbuild`~~
* ~~0.10.19 - `cusspvz/node:0.10.19` `cusspvz/node:0.10.19-onbuild`~~
* ~~0.10.18 - `cusspvz/node:0.10.18` `cusspvz/node:0.10.18-onbuild`~~
* ~~0.10.17 - `cusspvz/node:0.10.17` `cusspvz/node:0.10.17-onbuild`~~
* ~~0.10.16 - `cusspvz/node:0.10.16` `cusspvz/node:0.10.16-onbuild`~~
* ~~0.10.15 - `cusspvz/node:0.10.15` `cusspvz/node:0.10.15-onbuild`~~
* ~~0.10.14 - `cusspvz/node:0.10.14` `cusspvz/node:0.10.14-onbuild`~~
* ~~0.10.13 - `cusspvz/node:0.10.13` `cusspvz/node:0.10.13-onbuild`~~
* ~~0.10.12 - `cusspvz/node:0.10.12` `cusspvz/node:0.10.12-onbuild`~~
* ~~0.10.11 - `cusspvz/node:0.10.11` `cusspvz/node:0.10.11-onbuild`~~
* ~~0.10.10 - `cusspvz/node:0.10.10` `cusspvz/node:0.10.10-onbuild`~~
* ~~0.10.9 - `cusspvz/node:0.10.9` `cusspvz/node:0.10.9-onbuild`~~
* ~~0.10.8 - `cusspvz/node:0.10.8` `cusspvz/node:0.10.8-onbuild`~~
* ~~0.10.7 - `cusspvz/node:0.10.7` `cusspvz/node:0.10.7-onbuild`~~
* ~~0.10.6 - `cusspvz/node:0.10.6` `cusspvz/node:0.10.6-onbuild`~~
* ~~0.10.5 - `cusspvz/node:0.10.5` `cusspvz/node:0.10.5-onbuild`~~
* ~~0.10.4 - `cusspvz/node:0.10.4` `cusspvz/node:0.10.4-onbuild`~~
* ~~0.10.3 - `cusspvz/node:0.10.3` `cusspvz/node:0.10.3-onbuild`~~
* ~~0.10.2 - `cusspvz/node:0.10.2` `cusspvz/node:0.10.2-onbuild`~~
* ~~0.10.1 - `cusspvz/node:0.10.1` `cusspvz/node:0.10.1-onbuild`~~
* ~~0.10.0 - `cusspvz/node:0.10.0` `cusspvz/node:0.10.0-onbuild`~~
* ~~0.9.12 - `cusspvz/node:0.9.12` `cusspvz/node:0.9.12-onbuild`~~
* ~~0.9.11 - `cusspvz/node:0.9.11` `cusspvz/node:0.9.11-onbuild`~~
* ~~0.9.10 - `cusspvz/node:0.9.10` `cusspvz/node:0.9.10-onbuild`~~
* ~~0.9.9 - `cusspvz/node:0.9.9` `cusspvz/node:0.9.9-onbuild`~~
* ~~0.9.8 - `cusspvz/node:0.9.8` `cusspvz/node:0.9.8-onbuild`~~
* ~~0.9.7 - `cusspvz/node:0.9.7` `cusspvz/node:0.9.7-onbuild`~~
* ~~0.9.6 - `cusspvz/node:0.9.6` `cusspvz/node:0.9.6-onbuild`~~
* ~~0.9.5 - `cusspvz/node:0.9.5` `cusspvz/node:0.9.5-onbuild`~~
* ~~0.9.4 - `cusspvz/node:0.9.4` `cusspvz/node:0.9.4-onbuild`~~
* ~~0.9.3 - `cusspvz/node:0.9.3` `cusspvz/node:0.9.3-onbuild`~~
* ~~0.9.2 - `cusspvz/node:0.9.2` `cusspvz/node:0.9.2-onbuild`~~
* ~~0.9.1 - `cusspvz/node:0.9.1` `cusspvz/node:0.9.1-onbuild`~~
* ~~0.9.0 - `cusspvz/node:0.9.0` `cusspvz/node:0.9.0-onbuild`~~
* ~~0.8.28 - `cusspvz/node:0.8.28` `cusspvz/node:0.8.28-onbuild`~~
* ~~0.8.27 - `cusspvz/node:0.8.27` `cusspvz/node:0.8.27-onbuild`~~
* ~~0.8.26 - `cusspvz/node:0.8.26` `cusspvz/node:0.8.26-onbuild`~~
* ~~0.8.25 - `cusspvz/node:0.8.25` `cusspvz/node:0.8.25-onbuild`~~
* ~~0.8.24 - `cusspvz/node:0.8.24` `cusspvz/node:0.8.24-onbuild`~~
* ~~0.8.23 - `cusspvz/node:0.8.23` `cusspvz/node:0.8.23-onbuild`~~
* ~~0.8.22 - `cusspvz/node:0.8.22` `cusspvz/node:0.8.22-onbuild`~~
* ~~0.8.21 - `cusspvz/node:0.8.21` `cusspvz/node:0.8.21-onbuild`~~
* ~~0.8.20 - `cusspvz/node:0.8.20` `cusspvz/node:0.8.20-onbuild`~~
* ~~0.8.19 - `cusspvz/node:0.8.19` `cusspvz/node:0.8.19-onbuild`~~
* ~~0.8.18 - `cusspvz/node:0.8.18` `cusspvz/node:0.8.18-onbuild`~~
* ~~0.8.17 - `cusspvz/node:0.8.17` `cusspvz/node:0.8.17-onbuild`~~
* ~~0.8.16 - `cusspvz/node:0.8.16` `cusspvz/node:0.8.16-onbuild`~~
* ~~0.8.15 - `cusspvz/node:0.8.15` `cusspvz/node:0.8.15-onbuild`~~
* ~~0.8.14 - `cusspvz/node:0.8.14` `cusspvz/node:0.8.14-onbuild`~~
* ~~0.8.13 - `cusspvz/node:0.8.13` `cusspvz/node:0.8.13-onbuild`~~
* ~~0.8.12 - `cusspvz/node:0.8.12` `cusspvz/node:0.8.12-onbuild`~~
* ~~0.8.11 - `cusspvz/node:0.8.11` `cusspvz/node:0.8.11-onbuild`~~
* ~~0.8.10 - `cusspvz/node:0.8.10` `cusspvz/node:0.8.10-onbuild`~~
* ~~0.8.9 - `cusspvz/node:0.8.9` `cusspvz/node:0.8.9-onbuild`~~
* ~~0.8.8 - `cusspvz/node:0.8.8` `cusspvz/node:0.8.8-onbuild`~~
* ~~0.8.7 - `cusspvz/node:0.8.7` `cusspvz/node:0.8.7-onbuild`~~
* ~~0.8.6 - `cusspvz/node:0.8.6` `cusspvz/node:0.8.6-onbuild`~~
* ~~0.8.5 - `cusspvz/node:0.8.5` `cusspvz/node:0.8.5-onbuild`~~
* ~~0.8.4 - `cusspvz/node:0.8.4` `cusspvz/node:0.8.4-onbuild`~~
* ~~0.8.3 - `cusspvz/node:0.8.3` `cusspvz/node:0.8.3-onbuild`~~
* ~~0.8.2 - `cusspvz/node:0.8.2` `cusspvz/node:0.8.2-onbuild`~~
* ~~0.8.1 - `cusspvz/node:0.8.1` `cusspvz/node:0.8.1-onbuild`~~
* ~~0.8.0 - `cusspvz/node:0.8.0` `cusspvz/node:0.8.0-onbuild`~~
* ~~0.7.0 - `cusspvz/node:0.7.0` `cusspvz/node:0.7.0-onbuild`~~
* ~~0.7.1 - `cusspvz/node:0.7.1` `cusspvz/node:0.7.1-onbuild`~~
* ~~0.7.10 - `cusspvz/node:0.7.10` `cusspvz/node:0.7.10-onbuild`~~
* ~~0.7.11 - `cusspvz/node:0.7.11` `cusspvz/node:0.7.11-onbuild`~~
* ~~0.7.12 - `cusspvz/node:0.7.12` `cusspvz/node:0.7.12-onbuild`~~
* ~~0.7.2 - `cusspvz/node:0.7.2` `cusspvz/node:0.7.2-onbuild`~~
* ~~0.7.3 - `cusspvz/node:0.7.3` `cusspvz/node:0.7.3-onbuild`~~
* ~~0.7.4 - `cusspvz/node:0.7.4` `cusspvz/node:0.7.4-onbuild`~~
* ~~0.7.5 - `cusspvz/node:0.7.5` `cusspvz/node:0.7.5-onbuild`~~
* ~~0.7.6 - `cusspvz/node:0.7.6` `cusspvz/node:0.7.6-onbuild`~~
* ~~0.7.7 - `cusspvz/node:0.7.7` `cusspvz/node:0.7.7-onbuild`~~
* ~~0.7.8 - `cusspvz/node:0.7.8` `cusspvz/node:0.7.8-onbuild`~~
* ~~0.7.9 - `cusspvz/node:0.7.9` `cusspvz/node:0.7.9-onbuild`~~
* ~~0.6.21 - `cusspvz/node:0.6.21` `cusspvz/node:0.6.21-onbuild`~~
* ~~0.6.20 - `cusspvz/node:0.6.20` `cusspvz/node:0.6.20-onbuild`~~
* ~~0.6.19 - `cusspvz/node:0.6.19` `cusspvz/node:0.6.19-onbuild`~~
* ~~0.6.18 - `cusspvz/node:0.6.18` `cusspvz/node:0.6.18-onbuild`~~
* ~~0.6.17 - `cusspvz/node:0.6.17` `cusspvz/node:0.6.17-onbuild`~~
* ~~0.6.16 - `cusspvz/node:0.6.16` `cusspvz/node:0.6.16-onbuild`~~
* ~~0.6.15 - `cusspvz/node:0.6.15` `cusspvz/node:0.6.15-onbuild`~~
* ~~0.6.14 - `cusspvz/node:0.6.14` `cusspvz/node:0.6.14-onbuild`~~
* ~~0.6.13 - `cusspvz/node:0.6.13` `cusspvz/node:0.6.13-onbuild`~~
* ~~0.6.12 - `cusspvz/node:0.6.12` `cusspvz/node:0.6.12-onbuild`~~
* ~~0.6.11 - `cusspvz/node:0.6.11` `cusspvz/node:0.6.11-onbuild`~~
* ~~0.6.10 - `cusspvz/node:0.6.10` `cusspvz/node:0.6.10-onbuild`~~
* ~~0.6.9 - `cusspvz/node:0.6.9` `cusspvz/node:0.6.9-onbuild`~~
* ~~0.6.8 - `cusspvz/node:0.6.8` `cusspvz/node:0.6.8-onbuild`~~
* ~~0.6.7 - `cusspvz/node:0.6.7` `cusspvz/node:0.6.7-onbuild`~~
* ~~0.6.6 - `cusspvz/node:0.6.6` `cusspvz/node:0.6.6-onbuild`~~
* ~~0.6.5 - `cusspvz/node:0.6.5` `cusspvz/node:0.6.5-onbuild`~~
* ~~0.6.4 - `cusspvz/node:0.6.4` `cusspvz/node:0.6.4-onbuild`~~
* ~~0.6.3 - `cusspvz/node:0.6.3` `cusspvz/node:0.6.3-onbuild`~~
* ~~0.6.2 - `cusspvz/node:0.6.2` `cusspvz/node:0.6.2-onbuild`~~
* ~~0.6.1 - `cusspvz/node:0.6.1` `cusspvz/node:0.6.1-onbuild`~~
* ~~0.6.0 - `cusspvz/node:0.6.0` `cusspvz/node:0.6.0-onbuild`~~
* ~~0.5.10 - `cusspvz/node:0.5.10` `cusspvz/node:0.5.10-onbuild`~~
* ~~0.5.9 - `cusspvz/node:0.5.9` `cusspvz/node:0.5.9-onbuild`~~
* ~~0.5.8 - `cusspvz/node:0.5.8` `cusspvz/node:0.5.8-onbuild`~~
* ~~0.5.7 - `cusspvz/node:0.5.7` `cusspvz/node:0.5.7-onbuild`~~
* ~~0.5.6 - `cusspvz/node:0.5.6` `cusspvz/node:0.5.6-onbuild`~~
* ~~0.5.5 - `cusspvz/node:0.5.5` `cusspvz/node:0.5.5-onbuild`~~
* ~~0.5.4 - `cusspvz/node:0.5.4` `cusspvz/node:0.5.4-onbuild`~~
* ~~0.5.3 - `cusspvz/node:0.5.3` `cusspvz/node:0.5.3-onbuild`~~
* ~~0.5.2 - `cusspvz/node:0.5.2` `cusspvz/node:0.5.2-onbuild`~~
* ~~0.5.1 - `cusspvz/node:0.5.1` `cusspvz/node:0.5.1-onbuild`~~

## Developing

### Building image
```bash
VERSION="0.12.7" make build
```
