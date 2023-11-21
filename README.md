# spark-standalone-cluster
Deploying standalone spark on minikube in 8 steps.

We could group make targets to reduce the number of steps. However, we decided to keep smaller targets so you can understand better what is happening.

## Prerequisite

- [Docker](https://docs.docker.com/engine/install/ubuntu/)
- [Minikube](https://minikube.sigs.k8s.io/docs/start/)
- [VirtualBox](https://www.virtualbox.org/wiki/Linux_Downloads)


1. Start a cluster with predefined memory and cpu.
    ```
    make stop-cluster &&
    make delete-cluster &&
    make start-cluster
    ```

2. Build and Publish Docker image for Master and Workers nodes.
    ```
    make publish version=versionNamberHere
    ```

3. Buld and Publish Spark UI Proxy Image to reduce the burden to accessing web UI of Spark on different pods.
    ```
    make publish-proxy version=versionNumberHere
    ```

4. Create master node
    ```
    make create-master
    ```

5. Create workers nodes
    ```
    make create-workers
    ```

6. Create proxy
    ```
    make create-proxy
    ```

7. Verify instalation
    ```
    make get-pods
    ```

8.  Open spark ui on web browser.
    ```
    make open-ui
    ```


**You're good to go!**
