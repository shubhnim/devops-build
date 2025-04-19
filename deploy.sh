#!/bin/bash

# Exit if any command fails
set -e

CONTAINER_NAME="react-app"

echo "Stopping and removing old container (if exists)"
docker stop $CONTAINER_NAME || true
docker rm $CONTAINER_NAME || true

echo " Deploying container using docker-compose"
docker-compose up -d

echo "Deployment complete. App should be live on http://localhost"

