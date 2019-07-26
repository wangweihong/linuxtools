#!/bin/bash
set -x
set -e
sourceImageHub=gcrxio
k8sImageHub=k8s.gcr.io
privateRegistryHub=10.30.12.109/k8s.gcr.io


docker pull $sourceImageHub/kube-apiserver-amd64:v1.13.1
docker pull $sourceImageHub/kube-controller-manager-amd64:v1.13.1
docker pull $sourceImageHub/kube-scheduler-amd64:v1.13.1
docker pull $sourceImageHub/kube-proxy-amd64:v1.13.1
docker pull $sourceImageHub/pause:3.1
docker pull $sourceImageHub/etcd-amd64:3.2.24
docker pull $sourceImageHub/coredns:1.2.6
docker pull $sourceImageHub/kubernetes-dashboard-amd64:v1.10.1



# get from kubeadm config images list
#k8s.gcr.io/kube-apiserver:v1.13.0
#k8s.gcr.io/kube-controller-manager:v1.13.0
#k8s.gcr.io/kube-scheduler:v1.13.0
#k8s.gcr.io/kube-proxy:v1.13.0
#k8s.gcr.io/pause:3.1
#k8s.gcr.io/etcd:3.2.24
#k8s.gcr.io/coredns:1.2.6

docker tag $sourceImageHub/kube-apiserver-amd64:v1.13.1  $k8sImageHub/kube-apiserver:v1.13.1
docker tag $sourceImageHub/kube-controller-manager-amd64:v1.13.1 $k8sImageHub/kube-controller-manager:v1.13.1
docker tag $sourceImageHub/kube-scheduler-amd64:v1.13.1 $k8sImageHub/kube-scheduler:v1.13.1
docker tag $sourceImageHub/kube-proxy-amd64:v1.13.1 $k8sImageHub/kube-proxy:v1.13.1
docker tag $sourceImageHub/pause:3.1 $k8sImageHub/pause:3.1
docker tag $sourceImageHub/etcd-amd64:3.2.24 $k8sImageHub/etcd:3.2.24 
docker tag $sourceImageHub/coredns:1.2.6 $k8sImageHub/coredns:1.2.6
docker tag $sourceImageHub/kubernetes-dashboard-amd64:v1.10.1 $k8sImageHub/kubernetes-dashboard-amd64:v1.10.1

docker tag $sourceImageHub/kube-apiserver-amd64:v1.13.1  $privateRegistryHub/kube-apiserver:v1.13.1
docker tag $sourceImageHub/kube-controller-manager-amd64:v1.13.1 $privateRegistryHub/kube-controller-manager:v1.13.1
docker tag $sourceImageHub/kube-scheduler-amd64:v1.13.1 $privateRegistryHub/kube-scheduler:v1.13.1
docker tag $sourceImageHub/kube-proxy-amd64:v1.13.1 $privateRegistryHub/kube-proxy:v1.13.1
docker tag $sourceImageHub/pause:3.1 $privateRegistryHub/pause:3.1
docker tag $sourceImageHub/etcd-amd64:3.2.24 $privateRegistryHub/etcd:3.2.24 
docker tag $sourceImageHub/coredns:1.2.6 $privateRegistryHub/coredns:1.2.6
docker tag $sourceImageHub/kubernetes-dashboard-amd64:v1.10.1 $privateRegistryHub/kubernetes-dashboard-amd64:v1.10.1

#docker login $privateRegistryHub -u wangweihong
echo "Harbor12345" | docker login 10.30.12.109/k8s.gcr.io --username admin --password-stdin

docker push $privateRegistryHub/kube-apiserver:v1.13.1
docker push $privateRegistryHub/kube-controller-manager:v1.13.1
docker push $privateRegistryHub/kube-scheduler:v1.13.1
docker push $privateRegistryHub/kube-proxy:v1.13.1
docker push $privateRegistryHub/pause:3.1
docker push $privateRegistryHub/etcd:3.2.24 
docker push $privateRegistryHub/coredns:1.2.6
docker push  $privateRegistryHub/kubernetes-dashboard-amd64:v1.10.1


# addon
docker pull $sourceImageHub/addon-resizer:1.8.3
docker pull $sourceImageHub/elasticsearch:v6.3.0
docker pull $sourceImageHub/fluentd-elasticsearch:v2.3.2


docker tag $sourceImageHub/addon-resizer:1.8.3  $k8sImageHub/addon-resizer:1.8.3
docker tag $sourceImageHub/elasticsearch:v6.3.0 $k8sImageHub/elasticsearch:v6.3.0
docker tag $sourceImageHub/fluentd-elasticsearch:v2.3.2 $k8sImageHub/fluentd-elasticsearch:v2.3.2

docker tag $sourceImageHub/addon-resizer:1.8.3   $privateRegistryHub/addon-resizer:1.8.3
docker tag $sourceImageHub/elasticsearch:v6.3.0 $privateRegistryHub/elasticsearch:v6.3.0
docker tag $sourceImageHub/fluentd-elasticsearch:v2.3.2 $privateRegistryHub/fluentd-elasticsearch:v2.3.2


docker push  $privateRegistryHub/addon-resizer:1.8.3
docker push $privateRegistryHub/elasticsearch:v6.3.0
docker push $privateRegistryHub/fluentd-elasticsearch:v2.3.2





# 
#sonobuoy
# docker pull loongcn/sonobuoy-plugin-systemd-logs
# docker pull davinaqin/sonobuoy
# docker tag loongcn/sonobuoy-plugin-systemd-logs:latest gcr.io/heptio-images/sonobuoy-plugin-systemd-logs:latest
# docker tag davinaqin/sonobuoy:latest gcr.io/heptio-images/sonobuoy:v0.13.0
# 运行 sonobuoy run --pullImagePolicy=IfNotPresent


# dashboard
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v1.10.1/src/deploy/recommended/kubernetes-dashboard.yaml
