infra-arcana:
	docker build -t $@ - < $@.Dockerfile
	rm -rf ${PWD}/builds/$@
	mkdir -p ${PWD}/builds/$@
	docker run -v ${PWD}/builds/$@:/build/output:z $@

brogue:
	docker build -t $@ - < $@.Dockerfile
	rm -rf ${PWD}/builds/$@
	mkdir -p ${PWD}/builds/$@
	docker run -v ${PWD}/builds/$@:/build/output:z $@

crawl:
	docker build -t $@ - < $@.Dockerfile
	rm -rf ${PWD}/builds/$@
	mkdir -p ${PWD}/builds/$@
	docker run -v ${PWD}/builds/$@:/build/output:z $@

bcrawl:
	docker build -t $@ - < $@.Dockerfile
	rm -rf ${PWD}/builds/$@
	mkdir -p ${PWD}/builds/$@
	docker run -v ${PWD}/builds/$@:/build/output:z $@