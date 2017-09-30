# Cevo Website port to hugo

[Hugo](http://gohugo.io/getting-started/quick-start/) is static website generator.
`Dockerfile` produces build environment with `hugo` and `pygments` installed.

# How to develop?

* [Install Hugo](http://gohugo.io/getting-started/installing/) locally

* Clone this repository
  
  `git clone git@github.com:cevoaustralia/cevoaustralia.github.io.git`

* Install submodules (theme)
  
  `cd cevoaustralia.github.io`
  
  `git submodule update --init --recursive`

* Run the site locally on [http://localhost:1313](http://localhost:1313)
  
  `hugo serve`


## Local development with docker

* `docker-compose build dev`
* `docker-compose up dev`

## Build static html

* `docker-compose build alpha`
* `docker-compose run alpha`

Output is now in `public` folder.
