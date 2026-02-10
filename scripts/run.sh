#!/bin/bash
set -e

IMAGE_NAME=personal-site
CONTAINER_NAME=personal-site

docker stop $CONTAINER_NAME 2>/dev/null || true
docker rm $CONTAINER_NAME 2>/dev/null || true

docker build -t $IMAGE_NAME -f docker/Dockerfile .
docker run -d -p 80:80 --name $CONTAINER_NAME $IMAGE_NAME

echo "✅ Site is running on port 80"
