#!/bin/bash

# Set image names and Dockerfile paths
APP_IMAGE="my-python-app:latest"
APP_DOCKERFILE="./docker/app/Dockerfile"
DB_IMAGE="mongo:latest"
DB_DOCKERFILE="./docker/db/Dockerfile"

# Build Docker images
echo "Building Docker images..."
docker build -t "$APP_IMAGE" -f "$APP_DOCKERFILE" .
docker build -t "$DB_IMAGE" -f "$DB_DOCKERFILE" .

# # Load images into kind cluster
# echo "Loading Docker images into kind cluster..."
# kind load docker-image "$APP_IMAGE"
# kind load docker-image "$DB_IMAGE"

# Apply Kubernetes resources individually
echo "Applying Kubernetes resources from ./kubernetes/app..."
for file in ./kubernetes/app/*.yaml; 
do
    echo "Applying $file"
    kubectl apply -f "$file"
done

# Check if Ingress controller is already installed
if kubectl get pods -n ingress-nginx | grep -q "ingress-nginx-controller"; then
    echo "Ingress controller is already installed."
else
    echo "Installing Ingress controller..."
    
    # Installing NGINX Ingress Controller
    curl -o nginx-ingress.yaml https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml
    kubectl apply -f nginx-ingress.yaml
fi
