## 9-Out-2015

* Added `test` command which proxies to `npm test` on `/app` folder

## 8-Out-2015

* Added packages needed for some native modules

## 6-Out-2015

* Separated `onbuild` sugar feature to a different tagged images [#1](//github.com/cusspvz/node.docker/issues/1)
* Created this changelog!1 :p
* Added a Javascript generator on Makefile to allow me to inject Build Settings
on newer Docker Hub.
* Added `4.1.2` version
* Add Docker Hub build triggers so i don't have to track them from the UI
* Added `clean` on Makefile to clean development things
* Set `wget` to be non-verbose, so we don't get huge logs on DH.
* Added `sh` | `bash` option into entrypoint
* Added **Launcher**, a new way to run containerized node while developing

## 4-Out-2015

* Created support for all node versions
* Some of the versions aren't building correctly and/or image is too big, as ATM
I don't have time to investigate, I will let that task for later or for anyone
who wants to do it.
