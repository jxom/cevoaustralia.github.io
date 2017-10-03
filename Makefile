BUCKET=cevo-hugo
TRAVIS_BRANCH?=$(shell git rev-parse --abbrev-ref HEAD)

run:
	@hugo serve --baseUrl http://localhost:1313/

build:
	@hugo --baseUrl http://localhost:1313/

default: build

clean:
	rm -fr ./public

#
# Docker build for TravisCI 
#

docker-image:
	docker build -t hugo:latest .

travis-ci: docker-image
	docker run -v $(PWD):/data -w /data \
		hugo:latest make $(TRAVIS_BRANCH)

develop:
	@hugo --baseUrl http://beta.cevo.com.au/

master:
	@hugo --baseUrl https://cevo.com.au/

.PHONY: all clean dev alpha beta prod