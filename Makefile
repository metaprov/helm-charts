#!make
HELM_GCS_BUCKET := modela-charts
TARGETS         := darwin/amd64 linux/amd64 windows/amd64
SHELL           := bash -o pipefail
REGISTRY        ?= ghcr.io/metaprov
HELM_VERSION    := 3.0.0
CHART_TESTING_VERSION := 2.4.0
GOPATH          := $(shell go env GOPATH)
GOBIN           := $(GOPATH)/bin
BASE_VERSION    := 0.1.0
HELM            := helm
VERSION         ?= $(base_version)-$(shell git rev-parse --short=7 HEAD)
KUBECONFIG      ?= ~/.kube/config
FIND            :=find . -type f -not -path "*/vendor/*" -not -path "*/build/*" -not -path "*/.git/*" -not -path "*/site-packages/*" -not -path "*/fixture/*" -not -path "*/css/*" -not -path "*/node_modules/*" -not -path "*/.eggs/*"
PACKAGE         :=github.com/metaprov/modela
CURRENT_DIR     :=$(shell pwd)
REPO_ROOT       :=${CURRENT_DIR}
CLI_NAME        :=modelactl
VERSION         :=$(shell cat ${CURRENT_DIR}/VERSION)
BUILD_DATE      :=$(shell date -u +'%Y-%m-%dT%H:%M:%SZ')
GIT_COMMIT      :=$(shell git rev-parse HEAD)
GIT_TAG         :=$(shell if [ -z "`git status --porcelain`" ]; then git describe --exact-match --tags HEAD 2>/dev/null; fi)
GIT_TREE_STATE  :=$(shell if [ -z "`git status --porcelain`" ]; then echo "clean" ; else echo "dirty"; fi)
VERSION         :=latest
OS              :=$(go env GOOS)
ARCH            :=$(go env GOARCH)
OPERATOR_SDK_RELEASE_VERSION := v1.2.0

REPOSITORY_ROOT := $(patsubst %/,%,$(dir $(abspath $(MAKEFILE_LIST))))
BUILD_DIR = $(REPOSITORY_ROOT)/build
TOOLCHAIN_DIR = $(BUILD_DIR)/toolchain
TOOLCHAIN_BIN = $(TOOLCHAIN_DIR)/bin
HELM_PACKAGE = https://get.helm.sh/helm-v$(HELM_VERSION)-linux-amd64.tar.gz
CHART_TESTING_PACKAGE = https://github.com/helm/chart-testing/releases/download/v$(CHART_TESTING_VERSION)/chart-testing_$(CHART_TESTING_VERSION)_linux_amd64.tar.gz
CHART_TESTING_VERSION := 2.4.0
HELM = $(TOOLCHAIN_BIN)/helm$(EXE_EXTENSION)
CHART_TESTING = $(TOOLCHAIN_BIN)/ct$(EXE_EXTENSION)

# set go flags
override LDFLAGS += \
  -X ${PACKAGE}.version=${VERSION} \
  -X ${PACKAGE}.buildDate=${BUILD_DATE} \
  -X ${PACKAGE}.gitCommit=${GIT_COMMIT} \
  -X ${PACKAGE}.gitTreeState=${GIT_TREE_STATE}



# ----------------------------------
# Helm
# ----------------------------------
build/toolchain/bin/helm:
	mkdir -p $(TOOLCHAIN_BIN)
	mkdir -p $(TOOLCHAIN_DIR)/temp-helm
ifeq ($(suffix $(HELM_PACKAGE)),.zip)
	cd $(TOOLCHAIN_DIR)/temp-helm && curl -Lo helm.zip $(HELM_PACKAGE) && unzip -d $(TOOLCHAIN_BIN) -j -q -o helm.zip
else
	cd $(TOOLCHAIN_DIR)/temp-helm && curl -Lo helm.tar.gz $(HELM_PACKAGE) && tar xzf helm.tar.gz -C $(TOOLCHAIN_BIN) --strip-components 1
endif
	rm -rf $(TOOLCHAIN_DIR)/temp-helm/

build/toolchain/bin/ct:
	mkdir -p $(TOOLCHAIN_BIN)
	mkdir -p $(TOOLCHAIN_DIR)/temp-charttesting
ifeq ($(suffix $(CHART_TESTING_PACKAGE)),.zip)
	cd $(TOOLCHAIN_DIR)/temp-charttesting && curl -Lo charttesting.zip $(CHART_TESTING_PACKAGE) && unzip -j -q -o charttesting.zip
else
	cd $(TOOLCHAIN_DIR)/temp-charttesting && curl -Lo charttesting.tar.gz $(CHART_TESTING_PACKAGE) && tar xzf charttesting.tar.gz
endif
	mv $(TOOLCHAIN_DIR)/temp-charttesting/* $(TOOLCHAIN_BIN)
	rm -rf $(TOOLCHAIN_DIR)/temp-charttesting/

update-chart-deps: build/toolchain/bin/helm
	(cd $(REPOSITORY_ROOT)/charts/modela; $(HELM) repo add incubator https://kubernetes-charts-incubator.storage.googleapis.com; $(HELM) dependency update)

lint-chart: build/toolchain/bin/helm build/toolchain/bin/ct
	(cd $(REPOSITORY_ROOT)/charts/modela; $(HELM) lint $(MODELA_HELM_NAME))
	$(CHART_TESTING) lint --all --chart-yaml-schema $(TOOLCHAIN_BIN)/etc/chart_schema.yaml --lint-conf $(TOOLCHAIN_BIN)/etc/lintconf.yaml --chart-dirs $(REPOSITORY_ROOT)/charts/modela
	$(CHART_TESTING) lint --all --chart-yaml-schema $(TOOLCHAIN_BIN)/etc/chart_schema.yaml --lint-conf $(TOOLCHAIN_BIN)/etc/lintconf.yaml --chart-dirs $(REPOSITORY_ROOT)/charts/modela-default-tenant
	$(CHART_TESTING) lint-and-install --all --chart-yaml-schema $(TOOLCHAIN_BIN)/etc/chart_schema.yaml --lint-conf $(TOOLCHAIN_BIN)/etc/lintconf.yaml --chart-dirs $(REPOSITORY_ROOT)/charts/modela
	$(CHART_TESTING) lint-and-install --all --chart-yaml-schema $(TOOLCHAIN_BIN)/etc/chart_schema.yaml --lint-conf $(TOOLCHAIN_BIN)/etc/lintconf.yaml --chart-dirs $(REPOSITORY_ROOT)/charts/modela-default-tenant

build/chart/modela-$(BASE_VERSION).tgz: build/toolchain/bin/helm lint-chart
	mkdir -p $(BUILD_DIR)/chart/
	$(HELM) package -d $(BUILD_DIR)/chart/ --version $(BASE_VERSION) $(REPOSITORY_ROOT)/charts/modela

build/chart/modela-default-tenant-$(BASE_VERSION).tgz: build/toolchain/bin/helm lint-chart
	mkdir -p $(BUILD_DIR)/chart/
	$(HELM) package -d $(BUILD_DIR)/chart/ --version $(BASE_VERSION) $(REPOSITORY_ROOT)/charts/modela-default-tenant


build/chart/index.yaml: build/toolchain/bin/helm build/chart/modela-$(BASE_VERSION).tgz build/toolchain/bin/helm build/chart/modela-default-tenant-$(BASE_VERSION).tgz
	mkdir -p $(BUILD_DIR)/chart-index/
	$(HELM) repo index --merge $(BUILD_DIR)/chart-index/index.yaml $(BUILD_DIR)/chart/

build/chart/index.yaml.$(YEAR_MONTH_DAY): build/chart/index.yaml
	cp $(BUILD_DIR)/chart/index.yaml $(BUILD_DIR)/chart/index.yaml.$(YEAR_MONTH_DAY)

build/chart/: build/chart/index.yaml build/chart/index.yaml.$(YEAR_MONTH_DAY)

.PHONY: add-gcloud-repo
add-gcloud-repo:
	build/toolchain/bin/helm repo add modela https://storage.googleapis.com/modela-charts/chart/index.yaml

.PHONY: install-helm-gcs
install-helm-gcs:
	helm plugin install https://github.com/hayorov/helm-gcs.git

.PHONY: init-helm-bucket
init-helm-bucket:
	helm gcs init gs://$(HELM_GCS_BUCKET)

# Add your repository to Helm
.PHONY: add-helm-repo
add-helm-repo:
	helm repo remove modela
	helm repo add modela gs://$(HELM_GCS_BUCKET)

# Push a chart to your repository
.PHONY: push-helm-chart
push-helm-chart: build/chart/modela-$(BASE_VERSION).tgz build/chart/modela-default-tenant-$(BASE_VERSION).tgz
	helm gcs push --force build/chart/modela-$(BASE_VERSION).tgz modela
	helm gcs push --force build/chart/modela-default-tenant-$(BASE_VERSION).tgz modela


# Update Helm cachehel
.PHONY: update-helm-cache
update-helm-cache:
	helm repo update

.PHONY: fetch-helm-chart
fetch-helm-chart:
	helm fetch modela/modela

.PHONY: remove-helm-chart
remove-helm-chart:
	helm gcs rm chart modela

.PHONY: add-latest-helm-repo
add-latest-helm-repo:
	helm repo add modela-release https://modela-charts.storage.googleapis.com/


.PHONY: helm-install-modela
helm-install-modela:
	helm install modela1 modela-release/modela
