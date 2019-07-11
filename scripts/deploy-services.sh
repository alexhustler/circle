#!/bin/sh

set -eu

githash=$(echo $CIRCLE_SHA1 | head -c7)

deployService() {
  sed -e 's/__IMAGE_URL__/'"$CONTAINER_REGISTRY_URL\\/$1\\:$githash"'/g' < deploy/$2.yaml | kubectl apply --filename -
}

deployService build-image service-1

DEPLOY_WRITE_SERVICES=${DEPLOY_WRITE_SERVICES:-true}
if [ "${DEPLOY_WRITE_SERVICES}" = "true" ]; then
  echo "DEPLOYING WRITE SERVICES"
fi
