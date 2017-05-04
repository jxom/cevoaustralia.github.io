FROM ruby:alpine

RUN apk update && apk upgrade && apk add ruby-dev build-base

VOLUME [ "/data"]

ADD . /data

EXPOSE 4000

WORKDIR "/data"

RUN bundle install

CMD [ "jekyll", "serve" ]
