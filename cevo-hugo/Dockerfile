FROM ubuntu:16.04

RUN apt-get -y update && apt-get -y install make wget
RUN wget -c https://github.com/gohugoio/hugo/releases/download/v0.26/hugo_0.26_Linux-64bit.deb
RUN dpkg -i ./hugo_0.26_Linux-64bit.deb
