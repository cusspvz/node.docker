VERSION ?= latest
LATEST_VERSION := 4.1.1

ifeq ($(VERSION),latest)
	VERSION := $(LATEST_VERSION)
	TAG := latest
else
	TAG := $(VERSION)
endif

run: build
	@docker run --rm -ti cusspvz/node:${TAG}

run-bash: build
	@docker run --rm -ti cusspvz/node:${TAG} /bin/login.sh

fetch-versions:
	@wget https://nodejs.org/dist/ -O - 2>/dev/null | \
	grep "/\">v" | \
	sed -e 's/<a href="v\(.*\)\/".*/\1/' | \
	sort -t . -k1,1nr -k2,1nr -k3,1nr \
		> versions

build:
	@echo "Building ${TAG}"
	@cat Dockerfile | sed -e "s/NODE_VERSION=latest/NODE_VERSION=${VERSION}/" > Dockerfile.tmp
	@-docker build -t cusspvz/node:${TAG} -f Dockerfile.tmp .
	@rm Dockerfile.tmp

push: build
	docker push cusspvz/node:${TAG}

build-all: fetch-versions
	@for VERSION in $(shell cat versions); do \
		make VERSION=$$VERSION build; \
	done;

push-all: fetch-versions
	@for VERSION in $(shell cat versions); do \
		make VERSION=$$VERSION push; \
	done;
