#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
dockerpath=doksyilji/devops-proj

# Step 2
# Run the Docker Hub container with kubernetes
cat ~/environment/my_password.txt | docker login --username doksyilji --password-stdin
kubectl create deploy m1 --image=${dockerpath}:m1_remote_0.0.1

# Step 3:
# List kubernetes pods
kubectl get pods
POD=$(kubectl get pod -l app=m1 -o jsonpath="{.items[0].metadata.name}")

# Step 4:
# Forward the container port to a host
kubectl port-forward pod/$POD --address 0.0.0.0 8000:80

