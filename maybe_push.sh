#!/bin/sh -e

if [ "master" = "$TRAVIS_BRANCH" -a -n "$DOCKER_EMAIL" -a -n "$DOCKER_USERNAME" -a "$DOCKER_PASSWORD" ] ; then
  docker login -e="$DOCKER_EMAIL" -u="$DOCKER_USERNAME" -p="$DOCKER_PASSWORD"
  docker push empiricalsys/ubuntubayeslite
else
  echo >&2 "Not on master branch, or DOCKER_EMAIL, DOCKER_USERNAME, or DOCKER_PASSWORD unset, not pushing."
fi
