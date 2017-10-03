BUCKET=cevo-hugo
GIT_BRANCH=$(shell git symbolic-ref HEAD | sed -e 's,.*/\(.*\),\1,')

dev:
	@hugo serve --baseUrl http://localhost:1313/

default: dev

clean:
	rm -fr ./public

#
# Docker build for TravisCI 
#

docker-image:
	docker build -t hugo:latest .

docker-html: docker-image
	docker run -v $(PWD):/data -w /data \
		hugo:latest make $(GIT_BRANCH)

develop:
	@hugo --baseUrl http://beta.cevo.com.au/

master:
	@hugo --baseUrl https://cevo.com.au/

.PHONY: clean dev alpha beta prod
