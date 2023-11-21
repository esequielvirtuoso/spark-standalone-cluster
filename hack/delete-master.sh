#!/bin/bash
minikube kubectl -- delete replicationcontrollers/spark-master-controller --v=9 &&
minikube kubectl -- delete service spark-master --v=9 &&
minikube kubectl -- delete service spark-master-headless  --v=9
