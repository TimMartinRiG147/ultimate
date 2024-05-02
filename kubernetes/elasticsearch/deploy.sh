#!/bin/bash

# Exit on any error
set -e

# Namespace
NAMESPACE="monitoring"

# Create the namespace if it doesn't exist
kubectl create namespace $NAMESPACE || true

# Add the Elastic Helm repository
echo "Adding Elastic Helm repository..."
helm repo add elastic https://helm.elastic.co

# Update Helm repositories
echo "Updating Helm repositories..."
helm repo update

# Install Elasticsearch
echo "Installing Elasticsearch..."
helm install elasticsearch elastic/elasticsearch --set replicas=2 --namespace $NAMESPACE

# Install Kibana
echo "Installing Kibana..."
helm install kibana elastic/kibana --set service.type=NodePort --namespace $NAMESPACE

# Install Filebeat
echo "Installing Filebeat..."
helm install filebeat elastic/filebeat --namespace $NAMESPACE

# Apply ingress
echo "Applying ingress configuration..."
kubectl apply -f ./ingress.yaml --namespace $NAMESPACE

echo "Installation completed."
