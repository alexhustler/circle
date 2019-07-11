#!/bin/sh

set -eu

deployService() {
  sed -e 's/__IMAGE_URL__/'"$ECR_ACCOUNT_URL\\/$ECR_REPO_NAME\\:${CIRCLE_SHA1}_$1"'/g' < deploy/$2.yaml | kubectl apply --filename -
}

deployService build-image service-1

DEPLOY_WRITE_SERVICES=${DEPLOY_WRITE_SERVICES:-true}
if [ "${DEPLOY_WRITE_SERVICES}" = "true" ]; then
  echo "DEPLOYING WRITE SERVICES"
fi
