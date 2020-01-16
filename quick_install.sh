#!/bin/bash
helm repo update
helm install stable/prometheus-operator -n prometheus-operator -f helm-values/prometheus-operator-values.yml --namespace kube-ops
helm install stable/prometheus-adapter -n prometheus-adapter -f helm-values/prometheus-adapter-values.yml --namespace kube-ops
kubectl apply -f manifests/