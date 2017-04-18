VERSION ?= latest
LATEST_VERSION := $(shell sed -n '2p' versions)
REPO_PATH := $(shell pwd)

ifeq ($(VERSION),latest)
	VERSION := $(LATEST_VERSION)
	TAG := latest
else
	TAG := $(VERSION)
endif

VERSION_PATH := version/${TAG}

clean: clean-all-docker-images

run: build
	@docker run --rm -ti cusspvz/node:${TAG}

run-bash: build
	@docker run --rm -ti cusspvz/node:${TAG} /bin/login.sh

fetch-versions:
	@echo "latest" > ./versions
	@wget https://nodejs.org/dist/ -O - 2>/dev/null | \
	grep "/\">v" | grep -v isaacs-manual | \
	sed -e 's/<a href="v\(.*\)\/".*/\1/' | \
	sort -t . -k1,1nr -k2,1nr -k3,1nr \
		>> ./versions
	@cat versions

generate-version:
	@echo "Generating version dockerfiles: ${VERSION_PATH}"
	@mkdir -p ${VERSION_PATH}
	@cat src/Dockerfile | sed -e "s/NODE_VERSION=latest/NODE_VERSION=${VERSION}/" >${VERSION_PATH}/Dockerfile
	@echo "FROM cusspvz/node:${VERSION}" >${VERSION_PATH}/Dockerfile.onbuild;
	@cat src/Dockerfile.onbuild >> ${VERSION_PATH}/Dockerfile.onbuild;
	@echo "FROM cusspvz/node:${VERSION}" >${VERSION_PATH}/Dockerfile.onbuild-yarn;
	@cat src/Dockerfile.onbuild-yarn >> ${VERSION_PATH}/Dockerfile.onbuild-yarn;
	@echo "FROM cusspvz/node:${VERSION}" >${VERSION_PATH}/Dockerfile.development;
	@cat src/Dockerfile.development >> ${VERSION_PATH}/Dockerfile.development;
ifeq ($(VERSION),latest)
	@cp src/.travis.latest.yml ${VERSION_PATH}/.travis.yml;
else
	@cp src/.travis.yml ${VERSION_PATH}/.travis.yml;
endif



generate-tag-version:
	@rm -fR ${VERSION_PATH} && \
	mkdir -p ${VERSION_PATH} && \
	cd ${VERSION_PATH} && \
	git init && \
	git remote add origin git@github.com:cusspvz/node.docker.git && \
	{ \
		git fetch origin ${VERSION_PATH} && \
			git checkout ${VERSION_PATH} || \
			git checkout -b ${VERSION_PATH}; \
	} && \
	{ \
		make -C ${REPO_PATH} VERSION=${VERSION} generate-version && \
		git diff-index --quiet HEAD -- && { \
			echo "${VERSION}: No diff spotted"; \
		} || { \
			echo "${VERSION}: Uploading changes to GitHub" && \
			git add . && \
			git commit -m ${VERSION_PATH} && \
			git push origin ${VERSION_PATH} --force; \
		}; \
	} && \
	{ echo "${VERSION}: Finished" && exit 0; } || \
	{ echo "${VERSION}: Finished with some errors, please check." && exit 1; }


build: generate-version
	@echo "Building :${TAG} with ${VERSION} version"
	@docker build -t cusspvz/node:${TAG} ${VERSION_PATH}

push: build
	docker push cusspvz/node:${TAG}

generate-version-all: fetch-versions
	@for VERSION in $(shell cat versions); do \
		make VERSION=$$VERSION generate-version; \
	done;

generate-tag-version-all: fetch-versions
	@for VERSION in $(shell cat versions); do \
		make VERSION=$$VERSION generate-tag-version; \
	done;

build-all: fetch-versions
	@for VERSION in $(shell cat versions); do \
		make VERSION=$$VERSION build; \
	done;

push-all: fetch-versions
	@for VERSION in $(shell cat versions); do \
		make VERSION=$$VERSION push; \
	done;

deploy: generate-tag-version-all
