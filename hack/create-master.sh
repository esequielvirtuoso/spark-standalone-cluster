#!/bin/bash
minikube kubectl -- create -f ./spark-cluster/master/controller.yaml &&
minikube kubectl -- create -f ./spark-cluster/master/service.yaml
