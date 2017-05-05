#/bin/sh
# modified from https://hub.docker.com/r/abemedia/jekyll-ci/~/dockerfile/
export DON_PAGES_VERSION=0.0.6

# image_optim dependencies
export ADVANCECOMP_VERSION=1.23
export GIFSICLE_VERSION=1.88
export JHEAD_VERSION=3.00
export JPEGARCHIVE_VERSION=2.1.1
export JPEGOPTIM_VERSION=1.4.4
export JPEGTRAN_VERSION=9b
export MOZJPEG_VERSION=3.1
export OPTIPNG_VERSION=0.7.6
export PNGCRUSH_VERSION=1.8.11
export PNGOUT_VERSION=20150319
export PNGQUANT_VERSION=2.8.2

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

#echo "updating gems"
#echo 'gem: --no-document' >> /etc/gemrc
#gem update --system && gem update bundler && gem clean
#echo -e "source 'https://rubygems.org'\ngem 'don-pages', '$DON_PAGES_VERSION'" > Gemfile
#bundle install

echo "installing advancecomp"
curl -sL https://github.com/amadvance/advancecomp/releases/download/v$ADVANCECOMP_VERSION/advancecomp-$ADVANCECOMP_VERSION.tar.gz | tar zx
cd advancecomp-$ADVANCECOMP_VERSION
./configure && make && make install
cd .. \

echo "installing gifsicle"
curl -s https://www.lcdf.org/gifsicle/gifsicle-$GIFSICLE_VERSION.tar.gz | tar zx
cd gifsicle-$GIFSICLE_VERSION
./configure && make && make install
cd ..

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

echo "installing optipng"
curl -sL http://downloads.sourceforge.net/project/optipng/OptiPNG/optipng-$OPTIPNG_VERSION/optipng-$OPTIPNG_VERSION.tar.gz | tar zx
cd optipng-$OPTIPNG_VERSION
./configure && make && make install
cd ..

echo "installing pngcrush"
curl -sL http://downloads.sourceforge.net/project/pmt/pngcrush/$PNGCRUSH_VERSION/pngcrush-$PNGCRUSH_VERSION.tar.gz | tar zx
cd pngcrush-$PNGCRUSH_VERSION
make && cp -f pngcrush /usr/local/bin
cd ..

echo "installing pngout (binary distrib)"
curl -s http://static.jonof.id.au/dl/kenutils/pngout-$PNGOUT_VERSION-linux-static.tar.gz | tar zx
cd pngout-$PNGOUT_VERSION-linux-static
cp -f x86_64/pngout-static /usr/local/bin/pngout
cd ..

echo "installing pngquant"
curl -sL http://pngquant.org/pngquant-$PNGQUANT_VERSION-src.tar.gz | tar zx
cd pngquant-$PNGQUANT_VERSION
./configure && make && make install
cd ..

cd ..

echo "installing svgo"
npm install -g svgo

echo "cleaning up"
apk del build-dependencies

#rm -rf "${TMPDIR}"
