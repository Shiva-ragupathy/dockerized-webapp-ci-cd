#!/bin/bash

echo "Stopping old container..."
docker stop devops-app || true
docker rm devops-app || true

echo "Deploying application..."
docker-compose up -d --build

echo "Application deployed!"