#!/bin/bash

CONTAINER_NAME="my-ci-cd-app"
IMAGE_NAME="imumesh/ci-cd-demo"

echo "Stopping old container (if any)..."
docker stop $CONTAINER_NAME 2>/dev/null || true

echo "Removing old container (if any)..."
docker rm $CONTAINER_NAME 2>/dev/null || true

echo "Pulling latest image..."
docker pull $IMAGE_NAME

echo "Running new container..."
docker run -d -p 3000:3000 --name $CONTAINER_NAME $IMAGE_NAME

