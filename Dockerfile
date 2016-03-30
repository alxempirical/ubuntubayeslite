FROM ubuntu
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get install -y python-pip python-dev libboost-random1.55-dev
RUN pip install numpy cython
RUN pip install bayeslite
# Extraneous comment
