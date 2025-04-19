#!/bin/bash

# Exit if any command fails
set -e

IMAGE_NAME="app"
IMAGE_TAG="v1"

echo "Building Docker image: $IMAGE_NAME:$IMAGE_TAG"
docker build -t $IMAGE_NAME:$IMAGE_TAG .

echo "Build complete: $IMAGE_NAME:$IMAGE_TAG"

