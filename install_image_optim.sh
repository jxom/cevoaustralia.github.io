#/bin/sh
# modified from https://hub.docker.com/r/abemedia/jekyll-ci/~/dockerfile/

# image_optim dependencies
export JHEAD_VERSION=3.00
export JPEGARCHIVE_VERSION=2.1.1
export JPEGOPTIM_VERSION=1.4.4
export JPEGTRAN_VERSION=9b
export MOZJPEG_VERSION=3.1

# misc
export BUNDLE_SILENCE_ROOT_WARNING=1
export CI=true
export JEKYLL_ENV=production
export LANGUAGE=en_GB
export LANG=en_GB.UTF-8
export LC_ALL=en_GB

TMPDIR=$(mktemp -d)
cd "${TMPDIR}"

set -ex
echo "installing base dependancies"
apk add --no-cache --update curl ca-certificates git tar \
ruby ruby-bundler ruby-json libffi imagemagick libxslt \
nodejs libjpeg-turbo libpng

echo "installing build dependancies"
apk add --no-cache --update --virtual build-dependencies \
build-base bash ruby-dev libffi-dev libxml2-dev libxslt-dev libjpeg-turbo-dev \
zlib-dev bash libpng-dev pkgconfig autoconf automake libtool nasm

echo "install jhead"
curl -s http://www.sentex.net/~mwandel/jhead/jhead-$JHEAD_VERSION.tar.gz | tar zx
cd jhead-$JHEAD_VERSION
make && make install
cd ..

echo "installing jpegoptim"
curl -s http://www.kokkonen.net/tjko/src/jpegoptim-$JPEGOPTIM_VERSION.tar.gz | tar zx
cd jpegoptim-$JPEGOPTIM_VERSION
./configure && make && make install
cd ..

echo "installing jpeg-recompress (from jpeg-archive along with mozjpeg dependency)"
curl -sL https://github.com/mozilla/mozjpeg/archive/v$MOZJPEG_VERSION.tar.gz | tar zx
cd mozjpeg-$MOZJPEG_VERSION
autoreconf -fiv && ./configure && make && make install
cd ..
curl -sL https://github.com/danielgtaylor/jpeg-archive/archive/$JPEGARCHIVE_VERSION.tar.gz | tar zx
cd jpeg-archive-$JPEGARCHIVE_VERSION
make && make install
cd ..

echo "installing jpegtran (from Independent JPEG Group)"
curl -s http://www.ijg.org/files/jpegsrc.v$JPEGTRAN_VERSION.tar.gz | tar zx
cd jpeg-$JPEGTRAN_VERSION
./configure && make && make install
cd ..

cd ..

#rm -rf "${TMPDIR}"
