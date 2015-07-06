FROM phusion/baseimage
MAINTAINER Pavel Litvinenko <gerasim13@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV HOME /root

RUN apt-get update && apt-get install -y --no-install-recommends\
	build-essential python-dev curl git python-pycurl python-pip gifsicle \
	python-numpy python-opencv webp \
	libpng-dev libtiff-dev libjasper-dev libjpeg-dev libgif-dev \
	libdc1394-22-dev libdc1394-22 libdc1394-utils \
	libpng libtiff libjasper libjpeg \
	&& rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y --no-install-recommends\
  libgraphicsmagick++1-dev libboost-python-dev libcurl4-openssl-dev \
  && apt-get -y autoremove \
  && rm -rf /var/lib/apt/lists/*

COPY requirements.txt /tmp/
RUN pip install --upgrade pip
RUN pip install -r /tmp/requirements.txt

EXPOSE 8888

ENTRYPOINT ["thumbor"]
CMD ["-p 8888"]
