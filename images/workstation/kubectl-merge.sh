#!/bin/bash -e
cd ~/k8s
export KUBECONFIG=""

echo "Getting rancher clusters..."
# Get all clusters from rancher
clusters=$(rancher cluster ls --format '{{.Cluster.Name}}')
for cluster in $clusters; do
    echo -e "\t Getting kubeconfig for cluster $cluster..."
    rancher cluster kf $cluster > "${cluster}.yaml"
done

echo "Getting other kubeconfig files..."
# Load all yml and yaml files as kubeconfig files
for config in *y*ml; do
    echo -e "\t Adding kubeconfig for $config..."
    export KUBECONFIG=$KUBECONFIG:$config
done

# Merge them all into a single kubeconfig
kubectl config view --flatten > ~/.kube/config
unset KUBECONFIG
