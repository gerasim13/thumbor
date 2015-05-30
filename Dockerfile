FROM dkarchmervue/python27-opencv
MAINTAINER Pavel Litvinenko <gerasim13@gmail.com>

RUN apt-get update && apt-get -y upgrade
RUN apt-get -y dist-upgrade && apt-get -y autoremove

RUN apt-get install -y libgraphicsmagick++1-dev
RUN apt-get install -y libboost-python-dev
RUN apt-get install -y libcurl4-openssl-dev

COPY requirements.txt /tmp/
RUN pip install --upgrade pip
RUN pip install -r /tmp/requirements.txt

CMD ["thumbor"]
EXPOSE 8888
