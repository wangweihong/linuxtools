#!/bin/bash
set -e 
apt-get update && apt-get install -y apt-transport-https curl
#curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
apt-key add apt-key.gpg
#echo "deb [arch=amd64] https://mirrors.ustc.edu.cn/kubernetes/apt kubernetes-$(lsb_release -cs) main" | sudo tee -a /etc/apt/sources.list
apt-get update -y
apt-get install -y kubelet=1.13.1-00 kubeadm=1.13.1-00 kubectl=1.13.1-00 kubernetes-cni=0.6.0-00 --allow-change-held-packages
apt-mark hold kubelet kubeadm kubectl
