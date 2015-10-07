# cusspvz/node docker image

🌐Super small Node.js container (~20MB) based on Alpine Linux OS

![docker and node](https://cloud.githubusercontent.com/assets/3604053/10341946/c611ffd4-6d0e-11e5-8b18-e1d92e544c23.jpeg)


## What is this?

This is a repo for those who work with **Node.js** and **Docker**.

The propose of it is to cover all the needs since you start writing your first
file, to your rolling-update deployment.

As so, there are three things you need to know about this:
* `node.docker` Launcher - is a command-line tool which is a nice candidate to
  replace all your `node` calls, for a containerized one.
* `cusspvz/node:onbuild` docker image - Docker image with `ONBUILD` statements
  for helping you to deploy small, enhanced and *npm* standertized projects.
* `cusspvz/node:latest` docker image - Docker Image based on Alpine Linux, this
  is the base that is **empowering** the super-heros above.


## Usage

### Use node you want right away

What if you could develop using containers?
Here's a brief example of things you could do:

```bash
# Launch `index.js` using node 0.12.7
node.docker 0.12.7 ./index.js

# Guess what, you don't even need to have node installed.

# Without even having a Dockerfile, build and push a Docker Image from your app
cd ~/path/to/my/app
node.docker push 0.12.7 my-app:latest

# node.docker build node_version image_description
# node.docker run node_version image_description
# node.docker push node_version image_description
```

[Learn more about Launcher](./LAUNCHER.README.md)

### Using as your project's base image

You could use this image as a regular one, but we advise you to use `onbuild`
for rapid development.

Focus on your project instead of your **Dockerfile**. Keep It Simple, Stupid:
```Dockerfile
FROM cusspvz/node:0.12.7-onbuild
```

[Learn more about Onbuild](./ONBUILD.README.md)

## Examples

* [simple-http-server](./simple-http-server/README.md)

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
