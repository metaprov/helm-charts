# modela

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v0.0.1](https://img.shields.io/badge/AppVersion-v0.0.1-informational?style=flat-square)

Machine Learning Operators

**Homepage:** <https://modela.ai>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| metaprov | support@modela.ai | https://groups.google.com/forum/#!forum/modela-discuss |

## Source Code

* <https://github.com/metaprov/modela>

## Requirements

Kubernetes: `>= 1.15.0`

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| apigateway.http.port | int | `8080` |  |
| apigateway.image.registry | string | `"ghcr.io"` |  |
| apigateway.image.repository | string | `"metaprov/modela-api-gateway"` |  |
| apigateway.image.tag | string | `"latest"` |  |
| apigateway.name | string | `"modela-apiproxy"` |  |
| apigateway.ports.port | int | `8080` |  |
| apigateway.ports.protocol | string | `"TCP"` |  |
| apigateway.ports.targetPort | int | `8080` |  |
| apigateway.service.type | string | `"NodePort"` |  |
| apigateway.serviceAccount | string | `"modela-apigateway"` |  |
| apiproxy.http.port | int | `8080` |  |
| apiproxy.image.registry | string | `"ghcr.io"` |  |
| apiproxy.image.repository | string | `"metaprov/modela-api-proxy"` |  |
| apiproxy.image.tag | string | `"latest"` |  |
| apiproxy.name | string | `"modela-apiproxy"` |  |
| apiproxy.ports.port | int | `8080` |  |
| apiproxy.ports.protocol | string | `"TCP"` |  |
| apiproxy.ports.targetPort | int | `8080` |  |
| apiproxy.service.type | string | `"NodePort"` |  |
| apiproxy.serviceAccount | string | `"modela-apiproxy"` |  |
| clouds.http.port | int | `8090` |  |
| clouds.image.registry | string | `"ghcr.io"` |  |
| clouds.image.repository | string | `"metaprov/clouds"` |  |
| clouds.image.tag | string | `"latest"` |  |
| clouds.name | string | `"clouds"` |  |
| controlplane.http.port | int | `8080` |  |
| controlplane.image.registry | string | `"ghcr.io"` |  |
| controlplane.image.repository | string | `"metaprov/modela-control-plane"` |  |
| controlplane.image.tag | string | `"latest"` |  |
| controlplane.name | string | `"modela-controlplane"` |  |
| controlplane.ports.port | int | `8080` |  |
| controlplane.ports.protocol | string | `"TCP"` |  |
| controlplane.ports.targetPort | int | `8080` |  |
| controlplane.serviceAccount | string | `"modela-controlplane"` |  |
| datadock.http.port | int | `8095` |  |
| datadock.image.registry | string | `"ghcr.io"` |  |
| datadock.image.repository | string | `"metaprov/modela-datadock"` |  |
| datadock.image.tag | string | `"latest"` |  |
| datadock.name | string | `"modela-datadock"` |  |
| datadock.ports.port | int | `8080` |  |
| datadock.ports.protocol | string | `"TCP"` |  |
| datadock.ports.targetPort | int | `8080` |  |
| datadock.service.type | string | `"NodePort"` |  |
| datadock.serviceAccount | string | `"modela-datadock"` |  |
| dataplane.http.port | int | `8080` |  |
| dataplane.image.registry | string | `"ghcr.io"` |  |
| dataplane.image.repository | string | `"metaprov/modela-data-plane"` |  |
| dataplane.image.tag | string | `"latest"` |  |
| dataplane.name | string | `"model-dataplane"` |  |
| dataplane.ports.port | int | `8080` |  |
| dataplane.ports.protocol | string | `"TCP"` |  |
| dataplane.ports.targetPort | int | `8080` |  |
| dataplane.serviceAccount | string | `"modela-dataplane"` |  |
| deployment.updateStrategy.type | string | `"Recreate"` |  |
| frontend.fullnameOverride | string | `""` |  |
| frontend.image.name | string | `"modela-frontend"` |  |
| frontend.logLevel | string | `"info"` |  |
| frontend.nameOverride | string | `""` |  |
| frontend.ports.port | int | `8080` |  |
| frontend.ports.protocol | string | `"TCP"` |  |
| frontend.ports.targetPort | int | `8080` |  |
| frontend.replicaCount | int | `1` |  |
| frontend.service.type | string | `"ClusterIP"` |  |
| global.cachePath | string | `"/var/opt/modela/data"` |  |
| global.debug | bool | `false` |  |
| global.ha.enabled | bool | `false` |  |
| global.ha.replicaCount | int | `3` |  |
| global.imagePullPolicy | string | `"Always"` |  |
| global.imagePullSecrets | string | `""` |  |
| global.imageRegistry | string | `"ghcr.io"` |  |
| global.logAsJson | bool | `false` |  |
| global.mtls.allowedClockSkew | string | `"15m"` |  |
| global.mtls.enabled | bool | `true` |  |
| global.mtls.workloadCertTTL | string | `"24h"` |  |
| global.prometheus.enabled | bool | `true` |  |
| global.prometheus.port | int | `9090` |  |
| global.pullPolicy | string | `"IfNotPresent"` |  |
| global.registry | string | `"ghcr.io/metaprov"` |  |
| global.tag | string | `"latest"` |  |
| imagePullSecrets | string | `nil` |  |
| ingress.certManager | bool | `false` |  |
| ingress.enabled | bool | `true` |  |
| ingress.host | string | `"modela.info"` |  |
| ingress.name | string | `"modela-ingress"` |  |
| ingress.tls | bool | `false` |  |
| minikube.enabled | bool | `true` |  |
| namespace | string | `"modela-system"` |  |
| podSecurityPolicy.enabled | bool | `false` |  |
| presistence.cachePath | string | `"/var/opt/modela/data"` |  |
| rbac.create | bool | `true` |  |

