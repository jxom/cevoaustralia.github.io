BUCKET=cevo-hugo

dev:
	@hugo serve --baseUrl http://localhost:1313/

clean:
	rm -fr ./public

alpha: clean
	@hugo --baseURL http://new.cevo.com.au/

beta: clean
	@hugo --baseURL http://beta.cevo.com.au

prod: clean
	@hugo --baseURL http://cevo.com.au

upload:
	@aws s3 cp --recursive public s3://$(BUCKET)/

default: dev

.PHONY: clean dev alpha beta prod
