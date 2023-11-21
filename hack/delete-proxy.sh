#!/bin/bash
minikube kubectl -- delete replicationcontrollers/spark-ui-proxy-controller --v=9 &&
minikube kubectl -- delete service spark-ui-proxy --v=9
