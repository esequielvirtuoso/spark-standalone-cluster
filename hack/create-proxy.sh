#!/bin/bash
minikube kubectl -- create -f ./spark-cluster/ui-proxy/deployment.yaml &&
minikube kubectl -- create -f ./spark-cluster/ui-proxy/service.yaml
