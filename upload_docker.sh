#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
# dockerpath=<your docker ID/path>
dockerpath=doksyilji/devops-proj

# Step 2:  
# Authenticate & tag
cat ~/environment/my_password.txt | docker login --username doksyilji --password-stdin
docker tag m1:latest ${dockerpath}:m1_remote_0.0.1
echo "Docker ID and Image: $dockerpath"

# Step 3:
# Push image to a docker repository
docker push ${dockerpath}:m1_remote_0.0.1