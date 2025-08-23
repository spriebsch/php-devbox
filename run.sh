#!/bin/bash

IMAGE_NAME="php-devbox"
IMAGE_TAG="latest"
FULL_IMAGE_NAME="${IMAGE_NAME}:${IMAGE_TAG}"

if command -v podman &> /dev/null; then
    COMMAND=podman
elif command -v docker &> /dev/null; then
    COMMAND=docker
else
    echo "Error: Neither podman nor docker found. Please install one of them."
    exit 1
fi

$COMMAND run -it --rm -v $(pwd):/workspace ${FULL_IMAGE_NAME} bash
