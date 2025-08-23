#!/bin/bash

IMAGE_NAME="php-devbox"
IMAGE_TAG="latest"
FULL_IMAGE_NAME="${IMAGE_NAME}:${IMAGE_TAG}"

if command -v podman &> /dev/null; then
    podman run -it --rm -v $(pwd):/workspace ${FULL_IMAGE_NAME} bash
else
    docker run -it --rm -v $(pwd):/workspace ${FULL_IMAGE_NAME} bash
fi
