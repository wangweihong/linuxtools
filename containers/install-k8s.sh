#!/bin/bash
set -x
set -e
nodeName="k1"
imageRepository="10.30.12.109/k8s.gcr.io"

kubeadm init -v 9 --node-name=k1 --kubernetes-version=v1.13.1  --pod-network-cidr=11.0.0.0/16  --image-repository=$imageRepository  --node-name=k1
#kubeadm init -v 9 --node-name=k1 --kubernetes-version=v1.13.1   --image-repository=$imageRepository 

sleep 3
#kubectl apply -f https://docs.projectcalico.org/v3.3/getting-started/kubernetes/installation/hosted/rbac-kdd.yaml
#kubectl apply -f https://docs.projectcalico.org/v3.3/getting-started/kubernetes/installation/hosted/kubernetes-datastore/calico-networking/1.7/calico.yaml
export KUBECONFIG=/etc/kubernetes/admin.conf
kubectl apply -f calico/


kubectl apply -f kube-state-metrics/kubernetes/
