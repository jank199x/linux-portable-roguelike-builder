VERSION=master

ifeq ($(VERSION), master)
	DIRNAME := trunk
else
	DIRNAME := $(VERSION)
endif

infra-arcana:
	docker build --build-arg VERSION=${VERSION} -t $@ - < $@.Dockerfile
	rm -rf ${PWD}/builds/$@-${DIRNAME}
	mkdir -p ${PWD}/builds/$@-${DIRNAME}
	docker run -v ${PWD}/builds/$@-${DIRNAME}:/build/output:z $@

brogue:
	docker build --build-arg VERSION=${VERSION} -t $@ - < $@.Dockerfile
	rm -rf ${PWD}/builds/$@-${DIRNAME}
	mkdir -p ${PWD}/builds/$@-${DIRNAME}
	docker run -v ${PWD}/builds/$@-${DIRNAME}:/build/output:z $@

crawl:
	docker build --build-arg VERSION=${VERSION} -t $@ - < $@.Dockerfile
	rm -rf ${PWD}/builds/$@-${DIRNAME}
	mkdir -p ${PWD}/builds/$@-${DIRNAME}
	docker run -v ${PWD}/builds/$@-${DIRNAME}:/build/output:z $@

bcrawl:
	docker build --build-arg VERSION=${VERSION} -t $@ - < $@.Dockerfile
	rm -rf ${PWD}/builds/$@-${DIRNAME}
	mkdir -p ${PWD}/builds/$@-${DIRNAME}
	docker run -v ${PWD}/builds/$@-${DIRNAME}:/build/output:z $@