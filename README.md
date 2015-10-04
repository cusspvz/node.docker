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

I'm building images on my computer, as so, versions won't be available since I
have to check/build one by one.

:white_check_mark: - Built and working
:negative_squared_cross_mark: - Not built, or presenting errors.

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
* :negative_squared_cross_mark: 0.12.0 - `cusspvz/node:0.12.0`
* :negative_squared_cross_mark: 0.11.16 - `cusspvz/node:0.11.16`
* :negative_squared_cross_mark: 0.11.15 - `cusspvz/node:0.11.15`
* :negative_squared_cross_mark: 0.11.14 - `cusspvz/node:0.11.14`
* :negative_squared_cross_mark: 0.11.13 - `cusspvz/node:0.11.13`
* :negative_squared_cross_mark: 0.11.12 - `cusspvz/node:0.11.12`
* :negative_squared_cross_mark: 0.11.11 - `cusspvz/node:0.11.11`
* :negative_squared_cross_mark: 0.11.10 - `cusspvz/node:0.11.10`
* :negative_squared_cross_mark: 0.11.9 - `cusspvz/node:0.11.9`
* :negative_squared_cross_mark: 0.11.8 - `cusspvz/node:0.11.8`
* :negative_squared_cross_mark: 0.11.7 - `cusspvz/node:0.11.7`
* :negative_squared_cross_mark: 0.11.6 - `cusspvz/node:0.11.6`
* :negative_squared_cross_mark: 0.11.5 - `cusspvz/node:0.11.5`
* :negative_squared_cross_mark: 0.11.4 - `cusspvz/node:0.11.4`
* :negative_squared_cross_mark: 0.11.3 - `cusspvz/node:0.11.3`
* :negative_squared_cross_mark: 0.11.2 - `cusspvz/node:0.11.2`
* :negative_squared_cross_mark: 0.11.1 - `cusspvz/node:0.11.1`
* :negative_squared_cross_mark: 0.11.0 - `cusspvz/node:0.11.0`
* :negative_squared_cross_mark: 0.10.40 - `cusspvz/node:0.10.40`
* :negative_squared_cross_mark: 0.10.39 - `cusspvz/node:0.10.39`
* :negative_squared_cross_mark: 0.10.38 - `cusspvz/node:0.10.38`
* :negative_squared_cross_mark: 0.10.37 - `cusspvz/node:0.10.37`
* :negative_squared_cross_mark: 0.10.36 - `cusspvz/node:0.10.36`
* :negative_squared_cross_mark: 0.10.35 - `cusspvz/node:0.10.35`
* :negative_squared_cross_mark: 0.10.34 - `cusspvz/node:0.10.34`
* :negative_squared_cross_mark: 0.10.33 - `cusspvz/node:0.10.33`
* :negative_squared_cross_mark: 0.10.32 - `cusspvz/node:0.10.32`
* :negative_squared_cross_mark: 0.10.31 - `cusspvz/node:0.10.31`
* :negative_squared_cross_mark: 0.10.30 - `cusspvz/node:0.10.30`
* :negative_squared_cross_mark: 0.10.29 - `cusspvz/node:0.10.29`
* :negative_squared_cross_mark: 0.10.28 - `cusspvz/node:0.10.28`
* :negative_squared_cross_mark: 0.10.27 - `cusspvz/node:0.10.27`
* :negative_squared_cross_mark: 0.10.26 - `cusspvz/node:0.10.26`
* :negative_squared_cross_mark: 0.10.25 - `cusspvz/node:0.10.25`
* :negative_squared_cross_mark: 0.10.24 - `cusspvz/node:0.10.24`
* :negative_squared_cross_mark: 0.10.23 - `cusspvz/node:0.10.23`
* :negative_squared_cross_mark: 0.10.22 - `cusspvz/node:0.10.22`
* :negative_squared_cross_mark: 0.10.21 - `cusspvz/node:0.10.21`
* :negative_squared_cross_mark: 0.10.20 - `cusspvz/node:0.10.20`
* :negative_squared_cross_mark: 0.10.19 - `cusspvz/node:0.10.19`
* :negative_squared_cross_mark: 0.10.18 - `cusspvz/node:0.10.18`
* :negative_squared_cross_mark: 0.10.17 - `cusspvz/node:0.10.17`
* :negative_squared_cross_mark: 0.10.16 - `cusspvz/node:0.10.16`
* :negative_squared_cross_mark: 0.10.15 - `cusspvz/node:0.10.15`
* :negative_squared_cross_mark: 0.10.14 - `cusspvz/node:0.10.14`
* :negative_squared_cross_mark: 0.10.13 - `cusspvz/node:0.10.13`
* :negative_squared_cross_mark: 0.10.12 - `cusspvz/node:0.10.12`
* :negative_squared_cross_mark: 0.10.11 - `cusspvz/node:0.10.11`
* :negative_squared_cross_mark: 0.10.10 - `cusspvz/node:0.10.10`
* :negative_squared_cross_mark: 0.10.9 - `cusspvz/node:0.10.9`
* :negative_squared_cross_mark: 0.10.8 - `cusspvz/node:0.10.8`
* :negative_squared_cross_mark: 0.10.7 - `cusspvz/node:0.10.7`
* :negative_squared_cross_mark: 0.10.6 - `cusspvz/node:0.10.6`
* :negative_squared_cross_mark: 0.10.5 - `cusspvz/node:0.10.5`
* :negative_squared_cross_mark: 0.10.4 - `cusspvz/node:0.10.4`
* :negative_squared_cross_mark: 0.10.3 - `cusspvz/node:0.10.3`
* :negative_squared_cross_mark: 0.10.2 - `cusspvz/node:0.10.2`
* :negative_squared_cross_mark: 0.10.1 - `cusspvz/node:0.10.1`
* :negative_squared_cross_mark: 0.10.0 - `cusspvz/node:0.10.0`
* :negative_squared_cross_mark: 0.9.12 - `cusspvz/node:0.9.12`
* :negative_squared_cross_mark: 0.9.11 - `cusspvz/node:0.9.11`
* :negative_squared_cross_mark: 0.9.10 - `cusspvz/node:0.9.10`
* :negative_squared_cross_mark: 0.9.9 - `cusspvz/node:0.9.9`
* :negative_squared_cross_mark: 0.9.8 - `cusspvz/node:0.9.8`
* :negative_squared_cross_mark: 0.9.7 - `cusspvz/node:0.9.7`
* :negative_squared_cross_mark: 0.9.6 - `cusspvz/node:0.9.6`
* :negative_squared_cross_mark: 0.9.5 - `cusspvz/node:0.9.5`
* :negative_squared_cross_mark: 0.9.4 - `cusspvz/node:0.9.4`
* :negative_squared_cross_mark: 0.9.3 - `cusspvz/node:0.9.3`
* :negative_squared_cross_mark: 0.9.2 - `cusspvz/node:0.9.2`
* :negative_squared_cross_mark: 0.9.1 - `cusspvz/node:0.9.1`
* :negative_squared_cross_mark: 0.9.0 - `cusspvz/node:0.9.0`
* :negative_squared_cross_mark: 0.8.28 - `cusspvz/node:0.8.28`
* :negative_squared_cross_mark: 0.8.27 - `cusspvz/node:0.8.27`
* :negative_squared_cross_mark: 0.8.26 - `cusspvz/node:0.8.26`
* :negative_squared_cross_mark: 0.8.25 - `cusspvz/node:0.8.25`
* :negative_squared_cross_mark: 0.8.24 - `cusspvz/node:0.8.24`
* :negative_squared_cross_mark: 0.8.23 - `cusspvz/node:0.8.23`
* :negative_squared_cross_mark: 0.8.22 - `cusspvz/node:0.8.22`
* :negative_squared_cross_mark: 0.8.21 - `cusspvz/node:0.8.21`
* :negative_squared_cross_mark: 0.8.20 - `cusspvz/node:0.8.20`
* :negative_squared_cross_mark: 0.8.19 - `cusspvz/node:0.8.19`
* :negative_squared_cross_mark: 0.8.18 - `cusspvz/node:0.8.18`
* :negative_squared_cross_mark: 0.8.17 - `cusspvz/node:0.8.17`
* :negative_squared_cross_mark: 0.8.16 - `cusspvz/node:0.8.16`
* :negative_squared_cross_mark: 0.8.15 - `cusspvz/node:0.8.15`
* :negative_squared_cross_mark: 0.8.14 - `cusspvz/node:0.8.14`
* :negative_squared_cross_mark: 0.8.13 - `cusspvz/node:0.8.13`
* :negative_squared_cross_mark: 0.8.12 - `cusspvz/node:0.8.12`
* :negative_squared_cross_mark: 0.8.11 - `cusspvz/node:0.8.11`
* :negative_squared_cross_mark: 0.8.10 - `cusspvz/node:0.8.10`
* :negative_squared_cross_mark: 0.8.9 - `cusspvz/node:0.8.9`
* :negative_squared_cross_mark: 0.8.8 - `cusspvz/node:0.8.8`
* :negative_squared_cross_mark: 0.8.7 - `cusspvz/node:0.8.7`
* :negative_squared_cross_mark: 0.8.6 - `cusspvz/node:0.8.6`
* :negative_squared_cross_mark: 0.8.5 - `cusspvz/node:0.8.5`
* :negative_squared_cross_mark: 0.8.4 - `cusspvz/node:0.8.4`
* :negative_squared_cross_mark: 0.8.3 - `cusspvz/node:0.8.3`
* :negative_squared_cross_mark: 0.8.2 - `cusspvz/node:0.8.2`
* :negative_squared_cross_mark: 0.8.1 - `cusspvz/node:0.8.1`
* :negative_squared_cross_mark: 0.8.0 - `cusspvz/node:0.8.0`
* :negative_squared_cross_mark: 0.7.0 - `cusspvz/node:0.7.0`
* :negative_squared_cross_mark: 0.7.1 - `cusspvz/node:0.7.1`
* :negative_squared_cross_mark: 0.7.10 - `cusspvz/node:0.7.10`
* :negative_squared_cross_mark: 0.7.11 - `cusspvz/node:0.7.11`
* :negative_squared_cross_mark: 0.7.12 - `cusspvz/node:0.7.12`
* :negative_squared_cross_mark: 0.7.2 - `cusspvz/node:0.7.2`
* :negative_squared_cross_mark: 0.7.3 - `cusspvz/node:0.7.3`
* :negative_squared_cross_mark: 0.7.4 - `cusspvz/node:0.7.4`
* :negative_squared_cross_mark: 0.7.5 - `cusspvz/node:0.7.5`
* :negative_squared_cross_mark: 0.7.6 - `cusspvz/node:0.7.6`
* :negative_squared_cross_mark: 0.7.7 - `cusspvz/node:0.7.7`
* :negative_squared_cross_mark: 0.7.8 - `cusspvz/node:0.7.8`
* :negative_squared_cross_mark: 0.7.9 - `cusspvz/node:0.7.9`
* :negative_squared_cross_mark: 0.6.21 - `cusspvz/node:0.6.21`
* :negative_squared_cross_mark: 0.6.20 - `cusspvz/node:0.6.20`
* :negative_squared_cross_mark: 0.6.19 - `cusspvz/node:0.6.19`
* :negative_squared_cross_mark: 0.6.18 - `cusspvz/node:0.6.18`
* :negative_squared_cross_mark: 0.6.17 - `cusspvz/node:0.6.17`
* :negative_squared_cross_mark: 0.6.16 - `cusspvz/node:0.6.16`
* :negative_squared_cross_mark: 0.6.15 - `cusspvz/node:0.6.15`
* :negative_squared_cross_mark: 0.6.14 - `cusspvz/node:0.6.14`
* :negative_squared_cross_mark: 0.6.13 - `cusspvz/node:0.6.13`
* :negative_squared_cross_mark: 0.6.12 - `cusspvz/node:0.6.12`
* :negative_squared_cross_mark: 0.6.11 - `cusspvz/node:0.6.11`
* :negative_squared_cross_mark: 0.6.10 - `cusspvz/node:0.6.10`
* :negative_squared_cross_mark: 0.6.9 - `cusspvz/node:0.6.9`
* :negative_squared_cross_mark: 0.6.8 - `cusspvz/node:0.6.8`
* :negative_squared_cross_mark: 0.6.7 - `cusspvz/node:0.6.7`
* :negative_squared_cross_mark: 0.6.6 - `cusspvz/node:0.6.6`
* :negative_squared_cross_mark: 0.6.5 - `cusspvz/node:0.6.5`
* :negative_squared_cross_mark: 0.6.4 - `cusspvz/node:0.6.4`
* :negative_squared_cross_mark: 0.6.3 - `cusspvz/node:0.6.3`
* :negative_squared_cross_mark: 0.6.2 - `cusspvz/node:0.6.2`
* :negative_squared_cross_mark: 0.6.1 - `cusspvz/node:0.6.1`
* :negative_squared_cross_mark: 0.6.0 - `cusspvz/node:0.6.0`
* :negative_squared_cross_mark: 0.5.10 - `cusspvz/node:0.5.10`
* :negative_squared_cross_mark: 0.5.9 - `cusspvz/node:0.5.9`
* :negative_squared_cross_mark: 0.5.8 - `cusspvz/node:0.5.8`
* :negative_squared_cross_mark: 0.5.7 - `cusspvz/node:0.5.7`
* :negative_squared_cross_mark: 0.5.6 - `cusspvz/node:0.5.6`
* :negative_squared_cross_mark: 0.5.5 - `cusspvz/node:0.5.5`
* :negative_squared_cross_mark: 0.5.4 - `cusspvz/node:0.5.4`
* :negative_squared_cross_mark: 0.5.3 - `cusspvz/node:0.5.3`
* :negative_squared_cross_mark: 0.5.2 - `cusspvz/node:0.5.2`
* :negative_squared_cross_mark: 0.5.1 - `cusspvz/node:0.5.1`

## Developing

### Building image
```bash
VERSION="0.12.7" make build
```
