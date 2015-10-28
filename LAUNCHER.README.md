# node.docker launcher

A script that changes enhances your development workflow.

## Installing

```bash
# Put node.docker launcher into /usr/sbin :
wget -O /usr/sbin/node.docker https://raw.githubusercontent.com/cusspvz/node.docker/master/launcher;
chmod +x /usr/sbin/node.docker;

# In case you have node and prefer an NPM package:
npm i -g node.docker
```

Will re-use container image if its on cache, otherwise it will pull from DH.
```bash
bash-3.2$ node.docker 0.12.7
> 0.12.7 is up and running from dockercache
(^C again to quit)
>
bash-3.2$ node.docker 4.1.1
Unable to find image 'cusspvz/node:4.1.1' locally
4.1.1: Pulling from cusspvz/node
9caf287e1f2d: Pull complete
8119db1f2d0a: Pull complete
61f0af81675f: Pull complete
e13c97fc9799: Pull complete
66df5dd9107b: Pull complete
ade3d319c76d: Pull complete
72a38303450d: Pull complete
1604dce4bbd4: Pull complete
cf277c5850f6: Pull complete
cc338fe36fd0: Pull complete
180ccf3d5708: Pull complete
833c714afd86: Pull complete
b40cc318d49e: Pull complete
763343bc22ae: Pull complete
a002c2202bd2: Already exists
Digest: sha256:71e6749ed7ed0d78d74973c3f8ec91a9a3716a277e9a608389507263d40bcf21
Status: Downloaded newer image \for cusspvz/node:4.1.1
> although 4.1.1 was not, it was pulled right away
(^C again to quit)
>
bash-3.2$
```

## Usage

### Run specific version
```bash
node.docker x.x.x [node arguments] [path to your file]
```

### Build a docker image
```bash
node.docker build x.x.x image/name:tag
```

### Build and Execute a docker image
```bash
node.docker run x.x.x image/name:tag
```
