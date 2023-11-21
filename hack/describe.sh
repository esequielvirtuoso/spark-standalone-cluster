#!/bin/bash
what=$1

if [ "$what" = "master" ]; then
    minikube kubectl -- describe replicationcontrollers/spark-master-controller
    exit
fi

if [ "$what" = "workers" ]; then
    minikube kubectl -- describe replicationcontrollers/spark-worker-controller
    exit
fi

if [ "$what" = "proxy" ]; then
    minikube kubectl -- describe replicationcontrollers/spark-ui-proxy-controller
    exit
fi

echo "object $what not found"
