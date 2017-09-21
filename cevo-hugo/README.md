# Cevo Website port to hugo

[Hugo](http://gohugo.io/getting-started/quick-start/) is static website generator.

# How to build?

* [Install Hugo](http://gohugo.io/getting-started/installing/) locally
* `$ cd ~/src/website`
* `$ hugo serve`
* By default, the site locally runs on [http://localhost:1313](http://localhost:1313)
* You may also need to run `git submodule update --init --recursive`

# Docker and Docker-compose

`Dockerfile` produces ubuntu-based env with `hugo` installed.


## Local development with docker

* `$ docker-compose build dev`
* `$ docker-compose up dev`

## Build static website

* `$ docker-compose build alpha`
* `$ docker-compose run alpha`

Output is now in `public` folder.
