.PHONY: stop-cluster delete-cluster start-cluster build publish build-proxy publish-proxy create-master delete-master create-workers delete-workers create-proxy delete-proxy delete-all get-pods get-services get-deployments get-deployment describe-master open-ui
version ?= latest
REPO     = spark-nodes
HUB_HOST = hub.docker.com/repository/docker
HUB_USER = esequielvirtuoso
IMG_NAME = $(HUB_USER)/$(REPO):$(version)

PROXY_REPO  = spark-ui-proxy
PROXY_IMAGE = $(HUB_USER)/$(PROXY_REPO):$(version)

guard-%:
	@ if [ "${${*}}" = "" ]; then \
		echo "Variable '$*' not set"; \
		exit 1; \
	fi

stop-cluster:
	./hack/stop-cluster.sh

delete-cluster:
	./hack/delete-cluster.sh

start-cluster:
	./hack/start-cluster.sh

build: guard-version
	docker build . -t $(IMG_NAME) -f images/nodes/Dockerfile

publish: guard-version build
	docker push $(IMG_NAME)

build-proxy: guard-version
	docker build . -t $(PROXY_IMAGE) -f images/proxy/Dockerfile

publish-proxy: guard-version build-proxy
	docker push $(PROXY_IMAGE)

create-master:
	./hack/create-master.sh

delete-master:
	./hack/delete-master.sh

create-workers:
	./hack/create-workers.sh

delete-workers:
	./hack/delete-workers.sh

create-proxy:
	./hack/create-proxy.sh

delete-proxy:
	./hack/delete-proxy.sh

delete-all: delete-proxy delete-workers delete-master
	@echo "all resources deleted"

get-pods:
	./hack/get-pods.sh

get-services:
	./hack/get-services.sh

get-deployments:
	./hack/get-deployments.sh

describe-master:
	./hack/describe.sh master

describe-workers:
	./hack/describe.sh workers

describe-proxy:
	./hack/describe.sh proxy

scale-down-master:
	./hack/scale-master-pod.sh down

scale-up-master:
	./hack/scale-master-pod.sh up

open-ui:
	./hack/open-ui.sh
