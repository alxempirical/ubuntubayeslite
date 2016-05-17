FROM ubuntu
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get install --no-install-recommends -y python-pip
# build.sh puts wheels for all the bayeslite dependencies into venv/wheelhouse.
COPY venv/wheelhouse/* /usr/local/wheelhouse/
RUN pip install /usr/local/wheelhouse/*.whl
