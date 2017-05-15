# Cevo Website
Jekyll website for cevo.com.au

# Jekyll?
Jekyll is a simple way to build a static website. You can view more details at http://jekyllrb.com/

* The theme used here is from http://elbe.blahlab.com/

[ ![Codeship Status for cevoaustralia/cevoaustralia.github.io](https://codeship.com/projects/8fa2b1e0-44d0-0134-47ad-02154be91b77/status?branch=master)](https://codeship.com/projects/168509)

# How to develop (docker)
If you don't want to install Ruby and instead test the site in docker container:
```
docker-compose build
docker-compose up
```
This should build the docker image and run the server at http://localhost:4000/.

# How to develop

You need to have:
* a working Ruby environment
* ImageOptim and friends (jhead, jpegarchive, jpegoptim, jpegtran, and mozjpeg)
* this repository checked out

The site is developed as a set of static resources, and assembled into the resultant website through the use of [Jekyll][f0caf124]

## How to install dependencies

To install the image_optim dependancies (used to optimise the images for serving on the web)
on MacOS run  
```
brew install jhead jpegoptim jpeg
```

For linux see the requirements for your distribution [here](https://github.com/toy/image_optim)  


`bundler` is needed for all dependencies, including jekyll. If you are running `ruby` without it, it can be installed with

```
$ gem install bundler
```

The dependencies of the build have been included in a `Gemfile`, use `bundler` to

```
$ bundle install
```

If you are running in an rbenv you will need to run `rehash` for your commands to be exported to your shell
```
$ rbenv rehash
```

## How to serve the site locally

To run the server with the correct URL's and base paths, you will need to serve the content from

```
$ bundle exec jekyll serve
```

## How to build the site
```
$ bundle exec jekyll build
# => The current folder will be generated into ./_site

$ bundle exec jekyll build --watch
# => The current folder will be generated into ./_site,
#    watched for changes, and regenerated automatically.
```

### How to build the beta site

To ensure that the correct absolute URL's are generated for the `beta.cevo.com.au` site, you need
to specify an override file at build time to include the additional beta configuration.

```
# bundle exec jekyll build --config _config.yml,_config_beta.yml
```

### How to build the production site

To ensure that the correct absolute URL's are generated for the `www.cevo.com.au` site, you need
to specify an override file at build time to include the additional production configuration.

```
# bundle exec jekyll build --config _config.yml,_config_production.yml
```

[f0caf124]: https://jekyllrb.com/ "Jekyll"
