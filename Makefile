VERSION=master

ifeq ($(VERSION), master)
	DIRNAME := $(shell date +%y%m%d)
else
	DIRNAME := $(VERSION)
endif

.PHONY: build brogue brogue-init infra-arcana infra-arcana-init crawl crawl-init

crawl: crawl-init build
bcrawl: bcrawl-init build
infra-arcana: infra-arcana-init build
brogue: brogue-init build

build:
	docker build \
		--build-arg VERSION=${VERSION} \
		--build-arg REPO=${REPO} \
		-t jank/${GAME} - < ${DOCKERFILE}.Dockerfile
	rm -rf ${PWD}/builds/${GAME}-${DIRNAME}
	mkdir -p ${PWD}/builds/${GAME}-${DIRNAME}
	docker run -v ${PWD}/builds/${GAME}-${DIRNAME}:/build/output:z jank/${GAME}

brogue-init:
	$(eval GAME := brogue)
	$(eval DOCKERFILE := brogue)
	$(eval REPO := https://github.com/tmewett/BrogueCE.git)

infra-arcana-init:
	$(eval GAME := infra-arcana)
	$(eval DOCKERFILE := infra-arcana)
	$(eval REPO := https://gitlab.com/martin-tornqvist/ia.git)

crawl-init:
	$(eval GAME := crawl)
	$(eval DOCKERFILE := crawl)
	$(eval REPO := https://github.com/crawl/crawl.git)

bcrawl-init:
	$(eval GAME := bcrawl)
	$(eval DOCKERFILE := crawl)
	$(eval REPO := https://github.com/b-crawl/bcrawl.git)
