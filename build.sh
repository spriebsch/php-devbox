#!/bin/bash

set -e

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

echo "Building container image: ${FULL_IMAGE_NAME}"

if [ ! -f "container/Containerfile" ]; then
    echo "Error: Containerfile not found in current directory"
    exit 1
fi

$COMMAND build -t "${FULL_IMAGE_NAME}" -f container/Containerfile .

echo ""
echo "Run the container with ./run.sh"
echo ""
