DOCKER_USERNAME=dawi2332
DOCKER_NAME=skydns
DOCKER_TAG=$(DOCKER_USERNAME)/$(DOCKER_NAME):latest

.PHONY=all deps build push clean build-skydns

all:

push: build
	docker push $(DOCKER_TAG)

run: build
	docker run -it --rm $(DOCKER_TAG)

build: deps
	docker build -t $(DOCKER_TAG) .

deps: skydns

skydns:
	GOOS=linux GOARCH=386 CGO_ENABLED=0 go build -o skydns github.com/skynetservices/skydns

clean:
	rm -f skydns
