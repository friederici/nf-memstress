# nf-memstress

## Installation

### dependencies
Java 11+, Docker

### nextflow
    curl -s https://get.nextflow.io | bash

### minikube
    curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
    sudo install minikube-linux-amd64 /usr/local/bin/minikube

## Run

### minikube

    # minikube cluster with two nodes
    minikube start --nodes 2

    # use csi-hostpath-driver instead of default host-path provisioner
    minikube addons enable volumesnapshots
    minikube addons enable csi-hostpath-driver
    minikube addons disable storage-provisioner
    minikube addons disable default-storageclass
    kubectl patch storageclass csi-hostpath-sc -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"true"}}}' 

    # set up cluster
    minikube kubectl -- apply -f k8s.yaml

    # start workflow
    nextflow kuberun friederici/nf-memstress -r main -latest
