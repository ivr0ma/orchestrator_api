#!/bin/bash

set -e

DOCKER_HUB_USERNAME="ivroma"

function pull_or_build() {
  local image_name=$1
  local dockerfile_path=$2

  echo "Attempting to pull $DOCKER_HUB_USERNAME/$image_name:latest from Docker Hub..."
  if docker pull "$DOCKER_HUB_USERNAME/$image_name:latest"; then
    echo "Successfully pulled $DOCKER_HUB_USERNAME/$image_name:latest"
    docker tag "$DOCKER_HUB_USERNAME/$image_name:latest" "$image_name:latest"
    docker rmi "$DOCKER_HUB_USERNAME/$image_name:latest"
  else
    echo "Failed to pull $DOCKER_HUB_USERNAME/$image_name:latest. Building image locally..."
    docker build -t "$image_name:latest" "$dockerfile_path"
  fi
}

echo "Starting image setup..."

# Pull or build todo-sqlite
pull_or_build "todo_sqlite" "./todo-sqlite"

# Pull or build short_url
pull_or_build "short_url" "./short_url"

# Pull or build orchestrator_api_interface
pull_or_build "orchestrator_api_interface" "./orchestrator_api_interface"

echo "Image setup complete."
