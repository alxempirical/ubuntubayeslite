#!/bin/sh -e

export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get install -y --no-install-recommends python-pip
pip install wheelhouse/*.whl
apt-get clean
rm -rf /var/lib/apt/lists
