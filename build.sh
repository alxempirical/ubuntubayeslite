#!/bin/sh -e

# Make sure we have the latest ubuntu:latest
docker pull ubuntu
docker build -t ubuntubayeslite-wheels .
# Make a "wheels-container" from the image we just built, so we can mount it in
# a "build-container" to finish the build . First remove containers with those
# names, if they're hanging around from another build.
docker rm wheels-container || /bin/true
docker rm build-container || /bin/true
docker run --name wheels-container ubuntubayeslite-wheels /bin/true
# Now make another container from ubuntu:latest
docker run -it --name build-container \
       --volumes-from wheels-container \
       -v `pwd`/install.sh:/install.sh \
       ubuntu /install.sh
docker commit build-container empiricalsys/ubuntubayeslite
