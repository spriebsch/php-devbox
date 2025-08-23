#!/bin/bash

set -e

IMAGE_NAME="php-devbox"
IMAGE_TAG="latest"
FULL_IMAGE_NAME="${IMAGE_NAME}:${IMAGE_TAG}"

echo "Building container image: ${FULL_IMAGE_NAME}"

# Check if Containerfile exists
if [ ! -f "Containerfile" ]; then
    echo "Error: Containerfile not found in current directory"
    exit 1
fi

# Try podman first, fall back to docker
if command -v podman &> /dev/null; then
    podman build -t "${FULL_IMAGE_NAME}" -f Containerfile .
elif command -v docker &> /dev/null; then
    docker build -t "${FULL_IMAGE_NAME}" -f Containerfile .
else
    echo "Error: Neither podman nor docker found. Please install one of them."
    exit 1
fi

echo ""
echo "✅ Container build completed successfully!"
echo "Image name: ${FULL_IMAGE_NAME}"
echo ""
