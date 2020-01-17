#!/bin/bash
helm repo update
helm upgrade -i prometheus-operator stable/prometheus-operator -f helm-values/prometheus-operator-values.yml --namespace kube-ops
helm upgrade -i prometheus-adapter stable/prometheus-adapter -f helm-values/prometheus-adapter-values.yml --namespace kube-ops
kubectl apply -f manifests/