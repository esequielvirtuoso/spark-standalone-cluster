command=$1

if [ "$command" = "down" ]; then
    echo "stoping spark master"
    minikube kubectl -- scale replicationcontrollers/spark-master-controller --replicas=0
    exit
fi

echo "starting spark master"
minikube kubectl -- scale replicationcontrollers/spark-master-controller --replicas=1
