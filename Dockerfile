FROM phusion/baseimage
MAINTAINER Pavel Litvinenko <gerasim13@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV HOME /root

COPY requirements.txt /tmp/

RUN apt-get update
RUN apt-get install -y --no-install-recommends build-essential python-dev curl git python-pycurl python-pip gifsicle \
	python-numpy python-opencv webp libpng-dev libtiff-dev libjasper-dev libjpeg-dev libgif-dev \
	libdc1394-22-dev libdc1394-22 libdc1394-utils
RUN apt-get install -y --no-install-recommends libgraphicsmagick++1-dev libboost-python-dev libcurl4-openssl-dev
RUN apt-get install -y libpng3 libtiff5 libjasper1 libjpeg62 libjpeg8-dev libjpeg-turbo8 libjpeg-turbo8-dev
RUN apt-get -y autoremove
RUN rm -rf /var/lib/apt/lists/*
RUN pip install --upgrade pip
RUN pip install -r /tmp/requirements.txt
EXPOSE 8888

ENTRYPOINT ["thumbor"]
CMD ["-p 8888"]
