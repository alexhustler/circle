#!/bin/sh

set -eu

docker build\
  --target development-dependencies \
  --tag dev-image \
  --file ./Dockerfile .

docker build\
  --target build \
  --tag build-image \
  --file ./Dockerfile .
