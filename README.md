ubuntu docker image with bayeslite
==================================

Code to build an `ubuntu` image plus run `pip install bayeslite` and the
prerequisites for that command to work. For more on bayeslite, see
http://probcomp.csail.mit.edu/.

It is [served on Docker Hub](https://hub.docker.com/r/empiricalsys/ubuntubayeslite/) as
`empiricalsys/ubuntubayeslite`.

The current build status is at https://travis-ci.org/empiricalsys/ubuntubayeslite.

## Build process

Build by running `build.sh`.  It takes the following actions

1. `docker build` builds an image `ubuntubayeslite-wheels` from the
   `Dockerfile`. This image contains the wheels necessary to install bayeslite
   in an externally mountable volumue, `/wheelhouse`.

2. A "data container," `wheels-container` is initiated from
   `ubuntubayeslite-wheels` so that `/wheelhouse` can be mounted from it.

3. A new container, named `build-container`, is started from `ubuntu:latest`
   with `/wheelhouse` mounted in it. The `install.sh` script is run in it. This
   `apt-get` installs `pip`, then `pip install`s bayeslite from the wheels in
   `/wheelhouse`.

4. A new image, `empiricalsys/ubuntubayeslite` is commited from the
   `build-container`.
