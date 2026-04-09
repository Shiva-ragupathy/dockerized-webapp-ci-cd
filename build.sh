#!/bin/bash

echo "Building Docker image..."

docker build -t devops-app .

echo "Build completed!"