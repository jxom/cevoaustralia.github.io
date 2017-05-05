FROM ruby:alpine

RUN apk update && apk upgrade && apk add ruby-dev build-base

ADD install_image_optim.sh /tmp/install_image_optim.sh

RUN /tmp/install_image_optim.sh

VOLUME [ "/data"]

ADD . /data

EXPOSE 4000

WORKDIR "/data"

RUN bundle install
RUN bundle update

CMD [ "jekyll", "serve" ]
