# Cevo Website port to hugo

[Hugo](http://gohugo.io/getting-started/quick-start/) is static website generator.

# How to build?

* [Install](http://gohugo.io/getting-started/installing/) locally
* `$ cd ~/src/website`
* `$ hugo serve`
* open locally running [website](http://localhost:1313)

# Docker and Docker-compose

`Dockerfile` produces ubuntu-based env with `hugo` installed.


## Local development with docker

* `$ docker-compose build dev`
* `$ docker-compose up dev`

## Build static website

* `$ docker-compose build alpha`
* `$ docker-compose run alpha`

Output is now in `public` folder.
