.PHONY: stop-cluster delete-cluster start-cluster build publish build-proxy publish-proxy create-master create-workers create-proxy get-pods open-ui
version ?= latest
REPO     = spark-nodes
HUB_HOST = hub.docker.com/repository/docker
HUB_USER = esequielvirtuoso
IMG_NAME = $(HUB_USER)/$(REPO):$(version)

PROXY_REPO  = spark-ui-proxy
PROXY_IMAGE = IMG_NAME = $(HUB_USER)/$(PROXY_REPO):$(version)

guard-%:
	@ if [ "${${*}}" = "" ]; then \
		echo "Variable '$*' not set"; \
		exit 1; \
	fi

stop-cluster:
	./hack/stop-cluster.sh

delete-cluster:
	./hack/delete-cluster.sh

start-cluster: stop-cluster delete-cluster
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

create-workers:
	./hack/create-workers.sh

create-proxy:
	./hack/create-proxy.sh

get-pods:
	./hack/create-proxy.sh

open-ui:
	./hack/open-ui.sh
