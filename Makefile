VERSION = master

infra-arcana:
	docker build --build-arg VERSION=${VERSION} -t $@ - < $@.Dockerfile
	rm -rf ${PWD}/builds/$@-${VERSION}
	mkdir -p ${PWD}/builds/$@-${VERSION}
	docker run -v ${PWD}/builds/$@-${VERSION}:/build/output:z $@

brogue:
	docker build --build-arg VERSION=${VERSION} -t $@ - < $@.Dockerfile
	rm -rf ${PWD}/builds/$@-${VERSION}
	mkdir -p ${PWD}/builds/$@-${VERSION}
	docker run -v ${PWD}/builds/$@-${VERSION}:/build/output:z $@

crawl:
	docker build --build-arg VERSION=${VERSION} -t $@ - < $@.Dockerfile
	rm -rf ${PWD}/builds/$@-${VERSION}
	mkdir -p ${PWD}/builds/$@-${VERSION}
	docker run -v ${PWD}/builds/$@-${VERSION}:/build/output:z $@

bcrawl:
	docker build --build-arg VERSION=${VERSION} -t $@ - < $@.Dockerfile
	rm -rf ${PWD}/builds/$@-${VERSION}
	mkdir -p ${PWD}/builds/$@-${VERSION}
	docker run -v ${PWD}/builds/$@-${VERSION}:/build/output:z $@