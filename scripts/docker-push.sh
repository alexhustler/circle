#!/bin/sh

set -eu

githash=$(echo $CIRCLE_SHA1 | head -c7)

tagAndPush() {
  docker tag $1 $CONTAINER_REGISTRY_URL/$1:$githash
  docker tag $1 $CONTAINER_REGISTRY_URL/$1:latest
  docker push $CONTAINER_REGISTRY_URL/$1:$githash
  docker push $CONTAINER_REGISTRY_URL/$1:latest
}

tagAndPush dev-image
tagAndPush build-image
