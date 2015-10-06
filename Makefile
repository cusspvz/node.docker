VERSION ?= latest
LATEST_VERSION := 4.1.1

ifeq ($(VERSION),latest)
	VERSION := $(LATEST_VERSION)
	TAG := latest
else
	TAG := $(VERSION)
endif

VERSION_PATH := version/${TAG}/
VERSION_ONBUILD_PATH := version/${TAG}-onbuild/

DOCKER_HUB_BUILD_TOKEN := $(shell cat .dockerhubbuildtoken || 'none')

clean: clean-all-docker-images

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

gen-version:
	@echo "Generating version dockerfiles: ${VERSION_PATH} ${VERSION_ONBUILD_PATH}"
	@mkdir -p ${VERSION_PATH} ${VERSION_ONBUILD_PATH}
	@cat Dockerfile | sed -e "s/NODE_VERSION=latest/NODE_VERSION=${VERSION}/" >${VERSION_PATH}/Dockerfile
	@echo "FROM cusspvz/node:${VERSION}" >${VERSION_ONBUILD_PATH}/Dockerfile
	@cat Dockerfile.onbuild >> ${VERSION_ONBUILD_PATH}/Dockerfile;

build: gen-version
	@echo "Building ${TAG}"
	@docker build -t cusspvz/node:${TAG} -f ${VERSION_PATH}/Dockerfile .

push: build
	docker push cusspvz/node:${TAG}

gen-version-all:
	@for VERSION in $(shell cat versions); do \
		make VERSION=$$VERSION gen-version; \
	done;

build-all: fetch-versions
	@for VERSION in $(shell cat versions); do \
		make VERSION=$$VERSION build; \
	done;

push-all: fetch-versions
	@for VERSION in $(shell cat versions); do \
		make VERSION=$$VERSION push; \
	done;

gen-autosuildstore-build-tags-json-all:
	# Search for RepoPushTrigger component and inject this build_tags
	# Sorry DockerHub folks for not maintain any ids... :)
	@OUTPUT=""; \
	OUTPUT+="\$$r.props.newTags = ["; \
	for VERSION in $(shell cat versions); do \
		OUTPUT+="{\"isNew\":true,\"name\":\"$${VERSION}\",\"dockerfile_location\":\"/version/$${VERSION}\",\"source_name\":\"master\",\"source_type\":\"Branch\"},"; \
		OUTPUT+="{\"isNew\":true,\"name\":\"$${VERSION}-onbuild\",\"dockerfile_location\":\"/version/$${VERSION}-onbuild\",\"source_name\":\"master\",\"source_type\":\"Branch\"},"; \
	done; \
	OUTPUT+="];"; \
	OUTPUT+="\$$r.forceUpdate();"; \
	echo "$$OUTPUT";

show-all-docker-images:
	@docker images | grep "^cusspvz/node";

clean-all-docker-images:
	docker rmi -f \
		`docker images | grep "^cusspvz/node" | while read repo version image nonimportant; do echo $$image; done;`

trigger-all-docker-hub-build:
	@for VERSION in $(shell cat versions); do \
		echo "Triggering build for version $$VERSION"; \
		curl -H "Content-Type: application/json" --data '{"docker_tag": "$$VERSION"}' -X POST https://registry.hub.docker.com/u/cusspvz/node/trigger/${DOCKER_HUB_BUILD_TOKEN}/; \
		echo '--'; echo; \
	done;
	@echo "Sleeping for 120 secs, so we can trigger -onbuild builds"; sleep 120;
	@for VERSION in $(shell cat versions); do \
		echo "Triggering build for version $${VERSION}-onbuild"; \
		curl -H "Content-Type: application/json" --data '{"docker_tag": "$${VERSION}-onbuild"}' -X POST https://registry.hub.docker.com/u/cusspvz/node/trigger/${DOCKER_HUB_BUILD_TOKEN}/; \
		echo '--'; echo; \
	done;
