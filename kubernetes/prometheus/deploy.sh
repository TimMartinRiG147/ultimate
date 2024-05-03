#!/bin/bash

# Exit on any error
set -e

# Namespace
NAMESPACE="monitoring"

# Create the namespace if it doesn't exist
kubectl create namespace $NAMESPACE || true

# Add the Prometheus Helm chart repository
echo "Adding Prometheus Helm repository..."
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts

# Add the Grafana Helm chart repository
echo "Adding Grafana Helm repository..."
helm repo add grafana https://grafana.github.io/helm-charts

# Update Helm repositories
echo "Updating Helm repositories..."
helm repo update

# Install Prometheus
echo "Installing Prometheus..."
helm install prometheus prometheus-community/prometheus --namespace $NAMESPACE

# Install Grafana
echo "Installing Grafana..."
helm install grafana grafana/grafana --namespace $NAMESPACE --set adminPassword='admin'

# Apply ingress
echo "Applying ingress configuration..."
kubectl apply -f ./kubernetes/prometheus/ingress.yaml --namespace $NAMESPACE

# Output the Grafana admin password
echo "Grafana admin password:"
kubectl get secret --namespace $NAMESPACE grafana -o jsonpath="{.data.admin-password}" | base64 --decode; echo

echo "Installation completed."
