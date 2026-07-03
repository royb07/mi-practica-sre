#!/bin/bash
echo "🚀 Iniciando el despliegue del ecosistema de Observabilidad..."

# 1. Crear el namespace si no existe
kubectl create namespace monitoring --dry-run=client -o yaml | kubectl apply -f -

# 2. Agregar y actualizar los repos oficiales de Helm
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

# 3. Instalar usando nuestro archivo de valores guardado
helm upgrade --install kube-prometheus prometheus-community/kube-prometheus-stack \
  --namespace monitoring \
  -f monitoring/helm-values.yaml

echo "📊 ¡Suite de Monitoreo en camino! Revisa tus Pods con: kubectl get pods -n monitoring"