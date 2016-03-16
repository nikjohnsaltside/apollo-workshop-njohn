GIT_COMMIT:=$(shell git rev-parse --short HEAD)

.PHONY: build
build: Dockerfile
	docker build -t njohn/apollo-workshop .

.PHONY: push
push: build
	docker tag njohn/apollo-workshop njohn/apollo-workshop:$(GIT_COMMIT)
	docker push njohn/apollo-workshop:$(GIT_COMMIT)

.PHONY: test
test: build
	bin/apollo validate

.PHONY: deploy
deploy: push
	bin/apollo deploy -e production -m bikroy -t $(GIT_COMMIT)

