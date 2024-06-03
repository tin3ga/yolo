#!/bin/bash

# Define your Kubernetes configuration files directory
K8S_DIR="./k8s/deployments"


# Apply the Kubernetes config files
echo "Applying Kubernetes configuration files..."
kubectl apply -f $K8S_DIR