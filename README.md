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

This image supports sugar building, as so, you just have to include your app's
`package.json` on your `Dockerfile`.

As so, be sure to include a *package.json*:
```json
{
    "name": "my-awesome-app",
    "version": "1.0.3",
    "scripts": {
        "build": "echo \"console.log( require('./package.json').name )\" > index.js",
        "start": "node index.js"
    }
}
```

And a *Dockerfile* with this line **ONLY**:
```Dockerfile
FROM cusspvz/node:0.12.7
```

And run `docker build -t my-awesome-app:1.0.3 .`.

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

## Versions

~~I'm building images on my computer, as so, versions won't be available since I
have to check/build one by one.~~

Created `make VERSION=xxx gen-version` to create/update Dockerfile's for each
version so I can use Docker Hub builder instead. That doesn't mean that all
versions are working, as so, this list will be kept to be updated.

:white_check_mark: - Built and working

Others aren't built, or are presenting errors.

* :white_check_mark: 4.1.0 - `cusspvz/node:4.1.0`
* :white_check_mark: 4.1.1 - `cusspvz/node:4.1.1`
* :white_check_mark: 4.0.0 - `cusspvz/node:4.0.0`
* :white_check_mark: 0.12.7 - `cusspvz/node:0.12.7`
* :white_check_mark: 0.12.6 - `cusspvz/node:0.12.6`
* :white_check_mark: 0.12.5 - `cusspvz/node:0.12.5`
* :white_check_mark: 0.12.4 - `cusspvz/node:0.12.4`
* :white_check_mark: 0.12.3 - `cusspvz/node:0.12.3`
* :white_check_mark: 0.12.2 - `cusspvz/node:0.12.2`
* :white_check_mark: 0.12.1 - `cusspvz/node:0.12.1`
* ~~0.12.0 - `cusspvz/node:0.12.0`~~
* ~~0.11.16 - `cusspvz/node:0.11.16`~~
* ~~0.11.15 - `cusspvz/node:0.11.15`~~
* ~~0.11.14 - `cusspvz/node:0.11.14`~~
* ~~0.11.13 - `cusspvz/node:0.11.13`~~
* ~~0.11.12 - `cusspvz/node:0.11.12`~~
* ~~0.11.11 - `cusspvz/node:0.11.11`~~
* ~~0.11.10 - `cusspvz/node:0.11.10`~~
* ~~0.11.9 - `cusspvz/node:0.11.9`~~
* ~~0.11.8 - `cusspvz/node:0.11.8`~~
* ~~0.11.7 - `cusspvz/node:0.11.7`~~
* ~~0.11.6 - `cusspvz/node:0.11.6`~~
* ~~0.11.5 - `cusspvz/node:0.11.5`~~
* ~~0.11.4 - `cusspvz/node:0.11.4`~~
* ~~0.11.3 - `cusspvz/node:0.11.3`~~
* ~~0.11.2 - `cusspvz/node:0.11.2`~~
* ~~0.11.1 - `cusspvz/node:0.11.1`~~
* ~~0.11.0 - `cusspvz/node:0.11.0`~~
* ~~0.10.40 - `cusspvz/node:0.10.40`~~
* ~~0.10.39 - `cusspvz/node:0.10.39`~~
* ~~0.10.38 - `cusspvz/node:0.10.38`~~
* ~~0.10.37 - `cusspvz/node:0.10.37`~~
* ~~0.10.36 - `cusspvz/node:0.10.36`~~
* ~~0.10.35 - `cusspvz/node:0.10.35`~~
* ~~0.10.34 - `cusspvz/node:0.10.34`~~
* ~~0.10.33 - `cusspvz/node:0.10.33`~~
* ~~0.10.32 - `cusspvz/node:0.10.32`~~
* ~~0.10.31 - `cusspvz/node:0.10.31`~~
* ~~0.10.30 - `cusspvz/node:0.10.30`~~
* ~~0.10.29 - `cusspvz/node:0.10.29`~~
* ~~0.10.28 - `cusspvz/node:0.10.28`~~
* ~~0.10.27 - `cusspvz/node:0.10.27`~~
* ~~0.10.26 - `cusspvz/node:0.10.26`~~
* ~~0.10.25 - `cusspvz/node:0.10.25`~~
* ~~0.10.24 - `cusspvz/node:0.10.24`~~
* ~~0.10.23 - `cusspvz/node:0.10.23`~~
* ~~0.10.22 - `cusspvz/node:0.10.22`~~
* ~~0.10.21 - `cusspvz/node:0.10.21`~~
* ~~0.10.20 - `cusspvz/node:0.10.20`~~
* ~~0.10.19 - `cusspvz/node:0.10.19`~~
* ~~0.10.18 - `cusspvz/node:0.10.18`~~
* ~~0.10.17 - `cusspvz/node:0.10.17`~~
* ~~0.10.16 - `cusspvz/node:0.10.16`~~
* ~~0.10.15 - `cusspvz/node:0.10.15`~~
* ~~0.10.14 - `cusspvz/node:0.10.14`~~
* ~~0.10.13 - `cusspvz/node:0.10.13`~~
* ~~0.10.12 - `cusspvz/node:0.10.12`~~
* ~~0.10.11 - `cusspvz/node:0.10.11`~~
* ~~0.10.10 - `cusspvz/node:0.10.10`~~
* ~~0.10.9 - `cusspvz/node:0.10.9`~~
* ~~0.10.8 - `cusspvz/node:0.10.8`~~
* ~~0.10.7 - `cusspvz/node:0.10.7`~~
* ~~0.10.6 - `cusspvz/node:0.10.6`~~
* ~~0.10.5 - `cusspvz/node:0.10.5`~~
* ~~0.10.4 - `cusspvz/node:0.10.4`~~
* ~~0.10.3 - `cusspvz/node:0.10.3`~~
* ~~0.10.2 - `cusspvz/node:0.10.2`~~
* ~~0.10.1 - `cusspvz/node:0.10.1`~~
* ~~0.10.0 - `cusspvz/node:0.10.0`~~
* ~~0.9.12 - `cusspvz/node:0.9.12`~~
* ~~0.9.11 - `cusspvz/node:0.9.11`~~
* ~~0.9.10 - `cusspvz/node:0.9.10`~~
* ~~0.9.9 - `cusspvz/node:0.9.9`~~
* ~~0.9.8 - `cusspvz/node:0.9.8`~~
* ~~0.9.7 - `cusspvz/node:0.9.7`~~
* ~~0.9.6 - `cusspvz/node:0.9.6`~~
* ~~0.9.5 - `cusspvz/node:0.9.5`~~
* ~~0.9.4 - `cusspvz/node:0.9.4`~~
* ~~0.9.3 - `cusspvz/node:0.9.3`~~
* ~~0.9.2 - `cusspvz/node:0.9.2`~~
* ~~0.9.1 - `cusspvz/node:0.9.1`~~
* ~~0.9.0 - `cusspvz/node:0.9.0`~~
* ~~0.8.28 - `cusspvz/node:0.8.28`~~
* ~~0.8.27 - `cusspvz/node:0.8.27`~~
* ~~0.8.26 - `cusspvz/node:0.8.26`~~
* ~~0.8.25 - `cusspvz/node:0.8.25`~~
* ~~0.8.24 - `cusspvz/node:0.8.24`~~
* ~~0.8.23 - `cusspvz/node:0.8.23`~~
* ~~0.8.22 - `cusspvz/node:0.8.22`~~
* ~~0.8.21 - `cusspvz/node:0.8.21`~~
* ~~0.8.20 - `cusspvz/node:0.8.20`~~
* ~~0.8.19 - `cusspvz/node:0.8.19`~~
* ~~0.8.18 - `cusspvz/node:0.8.18`~~
* ~~0.8.17 - `cusspvz/node:0.8.17`~~
* ~~0.8.16 - `cusspvz/node:0.8.16`~~
* ~~0.8.15 - `cusspvz/node:0.8.15`~~
* ~~0.8.14 - `cusspvz/node:0.8.14`~~
* ~~0.8.13 - `cusspvz/node:0.8.13`~~
* ~~0.8.12 - `cusspvz/node:0.8.12`~~
* ~~0.8.11 - `cusspvz/node:0.8.11`~~
* ~~0.8.10 - `cusspvz/node:0.8.10`~~
* ~~0.8.9 - `cusspvz/node:0.8.9`~~
* ~~0.8.8 - `cusspvz/node:0.8.8`~~
* ~~0.8.7 - `cusspvz/node:0.8.7`~~
* ~~0.8.6 - `cusspvz/node:0.8.6`~~
* ~~0.8.5 - `cusspvz/node:0.8.5`~~
* ~~0.8.4 - `cusspvz/node:0.8.4`~~
* ~~0.8.3 - `cusspvz/node:0.8.3`~~
* ~~0.8.2 - `cusspvz/node:0.8.2`~~
* ~~0.8.1 - `cusspvz/node:0.8.1`~~
* ~~0.8.0 - `cusspvz/node:0.8.0`~~
* ~~0.7.0 - `cusspvz/node:0.7.0`~~
* ~~0.7.1 - `cusspvz/node:0.7.1`~~
* ~~0.7.10 - `cusspvz/node:0.7.10`~~
* ~~0.7.11 - `cusspvz/node:0.7.11`~~
* ~~0.7.12 - `cusspvz/node:0.7.12`~~
* ~~0.7.2 - `cusspvz/node:0.7.2`~~
* ~~0.7.3 - `cusspvz/node:0.7.3`~~
* ~~0.7.4 - `cusspvz/node:0.7.4`~~
* ~~0.7.5 - `cusspvz/node:0.7.5`~~
* ~~0.7.6 - `cusspvz/node:0.7.6`~~
* ~~0.7.7 - `cusspvz/node:0.7.7`~~
* ~~0.7.8 - `cusspvz/node:0.7.8`~~
* ~~0.7.9 - `cusspvz/node:0.7.9`~~
* ~~0.6.21 - `cusspvz/node:0.6.21`~~
* ~~0.6.20 - `cusspvz/node:0.6.20`~~
* ~~0.6.19 - `cusspvz/node:0.6.19`~~
* ~~0.6.18 - `cusspvz/node:0.6.18`~~
* ~~0.6.17 - `cusspvz/node:0.6.17`~~
* ~~0.6.16 - `cusspvz/node:0.6.16`~~
* ~~0.6.15 - `cusspvz/node:0.6.15`~~
* ~~0.6.14 - `cusspvz/node:0.6.14`~~
* ~~0.6.13 - `cusspvz/node:0.6.13`~~
* ~~0.6.12 - `cusspvz/node:0.6.12`~~
* ~~0.6.11 - `cusspvz/node:0.6.11`~~
* ~~0.6.10 - `cusspvz/node:0.6.10`~~
* ~~0.6.9 - `cusspvz/node:0.6.9`~~
* ~~0.6.8 - `cusspvz/node:0.6.8`~~
* ~~0.6.7 - `cusspvz/node:0.6.7`~~
* ~~0.6.6 - `cusspvz/node:0.6.6`~~
* ~~0.6.5 - `cusspvz/node:0.6.5`~~
* ~~0.6.4 - `cusspvz/node:0.6.4`~~
* ~~0.6.3 - `cusspvz/node:0.6.3`~~
* ~~0.6.2 - `cusspvz/node:0.6.2`~~
* ~~0.6.1 - `cusspvz/node:0.6.1`~~
* ~~0.6.0 - `cusspvz/node:0.6.0`~~
* ~~0.5.10 - `cusspvz/node:0.5.10`~~
* ~~0.5.9 - `cusspvz/node:0.5.9`~~
* ~~0.5.8 - `cusspvz/node:0.5.8`~~
* ~~0.5.7 - `cusspvz/node:0.5.7`~~
* ~~0.5.6 - `cusspvz/node:0.5.6`~~
* ~~0.5.5 - `cusspvz/node:0.5.5`~~
* ~~0.5.4 - `cusspvz/node:0.5.4`~~
* ~~0.5.3 - `cusspvz/node:0.5.3`~~
* ~~0.5.2 - `cusspvz/node:0.5.2`~~
* ~~0.5.1 - `cusspvz/node:0.5.1`~~

## Developing

### Building image
```bash
VERSION="0.12.7" make build
```
