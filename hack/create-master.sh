#!/bin/bash
minikube kubectl -- create -f ./spark-cluster/master/controller.yaml --v=9 &&
minikube kubectl -- create -f ./spark-cluster/master/service.yaml --v=9
