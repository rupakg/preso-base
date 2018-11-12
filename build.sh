#!/bin/bash

### CHANGE THIS
IMAGE_NAMESPACE="rupakg"
IMAGE_NAME="preso-base"

# pass an optional tag for the image
IMAGE_TAG=$1
if [[ -z "${IMAGE_TAG}" ]]; then
  IMAGE_TAG="latest-onbuild"
fi

# build the image
docker build -t ${IMAGE_NAMESPACE}/${IMAGE_NAME}:${IMAGE_TAG} .
if [[ "$?" != "0" ]]; then
  echo -e "\n Problem with docker build.... Aborting"
  exit -1;
fi

echo -e "\n Docker build successful."
