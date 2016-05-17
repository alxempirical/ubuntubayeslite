#!/bin/sh -e

rm -rf venv
virtualenv venv

./venv/bin/pip install numpy cython
./venv/bin/pip wheel --wheel-dir=venv/wheelhouse bayeslite

docker build -t empiricalsys/ubuntubayeslite .
