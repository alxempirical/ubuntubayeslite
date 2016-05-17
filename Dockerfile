FROM ubuntu
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get install -y python-pip python-dev
RUN pip install numpy cython
# XXX: In my hands, building a wheel for crosscat directly does not work, but
# preceeding wheel construction with an install does.
RUN pip install crosscat
RUN pip wheel --wheel-dir=wheelhouse bayeslite
RUN pip install wheelhouse/bayeslite*.whl
VOLUME ["/wheelhouse"]
