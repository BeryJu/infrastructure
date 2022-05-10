#!/bin/bash -xe
cd ~/k8s
export KUBECONFIG=""

# Get all clusters from rancher
clusters=$(rancher cluster ls --format '{{.Cluster.Name}}')
for cluster in $clusters; do
    rancher cluster kf $cluster > "${cluster}.yaml"
done

# Load all yml and yaml files as kubeconfig files
for config in *y*ml; do
    export KUBECONFIG=$KUBECONFIG:$config
done

# Merge them all into a single kubeconfig
kubectl config view --flatten > ~/.kube/config
unexport KUBECONFIG
