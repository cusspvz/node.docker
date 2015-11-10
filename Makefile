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
VERSION_DIND_PATH := version/${TAG}-dind/

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
	@echo "Generating version dockerfiles: ${VERSION_PATH} ${VERSION_ONBUILD_PATH} ${VERSION_DIND_PATH}"
	@mkdir -p ${VERSION_PATH} ${VERSION_ONBUILD_PATH} ${VERSION_DIND_PATH}
	@cat Dockerfile | sed -e "s/NODE_VERSION=latest/NODE_VERSION=${VERSION}/" >${VERSION_PATH}/Dockerfile
	@echo "FROM cusspvz/node:${VERSION}" >${VERSION_ONBUILD_PATH}/Dockerfile
	@cat Dockerfile.onbuild >> ${VERSION_ONBUILD_PATH}/Dockerfile;
	@echo "FROM cusspvz/node:${VERSION}" >${VERSION_DIND_PATH}/Dockerfile
	@cat Dockerfile.dind >> ${VERSION_DIND_PATH}/Dockerfile;

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

gen-build-json:
	@echo "{\"isNew\":true,\"name\":\"${VERSION}\",\"dockerfile_location\":\"/version/$${VERSION}\",\"source_name\":\"master\",\"source_type\":\"Branch\"}";

gen-build-onbuild-json:
	@echo "{\"isNew\":true,\"name\":\"${VERSION}-onbuild\",\"dockerfile_location\":\"/version/$${VERSION}-onbuild\",\"source_name\":\"master\",\"source_type\":\"Branch\"}";

gen-autosuildstore-build-tags-json-all:
	# Search for RepoPushTrigger component and inject this build_tags
	# Sorry DockerHub folks for not maintain any ids... :)
	@OUTPUT=""; \
	OUTPUT+="\$$r.props.newTags = ["; \
	for VERSION in $(shell cat checked_versions); do \
		OUTPUT+="$$(make VERSION=$$VERSION gen-build-json),"; \
		OUTPUT+="$$(make VERSION=$$VERSION gen-build-onbuild-json),"; \
	done; \
	OUTPUT+="];"; \
	OUTPUT+="\$$r.forceUpdate();"; \
	echo "$$OUTPUT";

docker-hub-build:
	@echo "Triggering build for version ${VERSION}";
	@curl -H "Content-Type: application/json" --data "$$(make VERSION=${VERSION} gen-build-json)" -X POST https://registry.hub.docker.com/u/cusspvz/node/trigger/${DOCKER_HUB_BUILD_TOKEN}/;

docker-hub-onbuild-build:
	@echo "Triggering build for version ${VERSION}";
	@curl -H "Content-Type: application/json" --data "$$(make VERSION=${VERSION} gen-build-onbuild-json)" -X POST https://registry.hub.docker.com/u/cusspvz/node/trigger/${DOCKER_HUB_BUILD_TOKEN}/;

show-all-docker-images:
	@docker images | grep "^cusspvz/node";

clean-all-docker-images:
	docker rmi -f \
		`docker images | grep "^cusspvz/node" | while read repo version image nonimportant; do echo $$image; done;`

trigger-checked-docker-hub-build:
	@for VERSION in $(shell cat checked_versions); do \
		make VERSION=$$VERSION docker-hub-build; \
		sleep 20; \
		echo; \
	done;
	@echo "Sleeping for 120 secs, so we can trigger -onbuild builds"; sleep 120;
	@for VERSION in $(shell cat checked_versions); do \
		make VERSION=$$VERSION docker-hub-onbuild-build; \
		sleep 20; \
		echo; \
	done;
