#!/bin/bash

# Script to build and tag Docker images for Todo Chatbot

set -e

echo "Building Todo Chatbot Docker images..."

# Build backend image
echo "Building backend image..."
cd /app/todo-chatbot/backend
docker build -t todo-backend:latest .

# Build frontend image
echo "Building frontend image..."
cd ../frontend
docker build -t todo-frontend:latest .

echo "Images built successfully!"
echo "Backend image: todo-backend:latest"
echo "Frontend image: todo-frontend:latest"

# Optionally tag and push to a registry
if [ "$1" == "--push" ]; then
    echo "Tagging and pushing images to registry..."
    REGISTRY=${REGISTRY:-localhost:5000}
    
    docker tag todo-backend:latest $REGISTRY/todo-backend:latest
    docker tag todo-frontend:latest $REGISTRY/todo-frontend:latest
    
    docker push $REGISTRY/todo-backend:latest
    docker push $REGISTRY/todo-frontend:latest
    
    echo "Images pushed to $REGISTRY"
fi

echo "Build process completed!"