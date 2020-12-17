# modeld-stack

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v0.0.1](https://img.shields.io/badge/AppVersion-v0.0.1-informational?style=flat-square)

full stack for modeld

**Homepage:** <https://modeld.io>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| metaprov | support@modeld.io | https://groups.google.com/forum/#!forum/modeld-discuss |

## Source Code

* <https://github.com/metaprov/modeld>

## Requirements

Kubernetes: `>= 1.15.0`

| Repository | Name | Version |
|------------|------|---------|
| https://charts.jetstack.io | cert-manager | ~1.1.0 |
| https://grafana.github.io/helm-charts | grafana | ~5.7.0 |
| https://grafana.github.io/helm-charts | loki | ^2.0.0 |
| https://helm.elastic.co | filebeat | ~7.8.0 |
| https://helm.elastic.co | logstash | ~7.8.0 |
| https://prometheus-community.github.io/helm-charts | prometheus | ~11.16.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| certmanager.enabled | bool | `false` |  |
| filebeat.enabled | bool | `false` |  |
| filebeat.filebeatConfig."filebeat.yml" | string | `"# logging.level: debug\nfilebeat.inputs:\n- type: container\n  paths:\n    - /var/log/containers/*.log\n  processors:\n  - add_kubernetes_metadata:\n      host: ${NODE_NAME}\n      matchers:\n      - logs_path:\n          logs_path: \"/var/log/containers/\"\noutput.logstash:\n  hosts: [\"logstash-loki:5044\"]\n"` |  |
| fluent-bit.enabled | bool | `false` |  |
| grafana.enabled | bool | `false` |  |
| grafana.image.tag | string | `"6.7.0"` |  |
| grafana.sidecar.datasources.enabled | bool | `true` |  |
| logstash.enabled | bool | `false` |  |
| logstash.filters.main | string | `"filter {\n  if [kubernetes] {\n    mutate {\n      add_field => {\n        \"container_name\" => \"%{[kubernetes][container][name]}\"\n        \"namespace\" => \"%{[kubernetes][namespace]}\"\n        \"pod\" => \"%{[kubernetes][pod][name]}\"\n      }\n      replace => { \"host\" => \"%{[kubernetes][node][name]}\"}\n    }\n  }\n  mutate {\n    remove_field => [\"tags\"]\n  }\n}"` |  |
| logstash.image | string | `"grafana/logstash-output-loki"` |  |
| logstash.imageTag | string | `"1.0.1"` |  |
| logstash.outputs.main | string | `"output {\n  loki {\n    url => \"http://loki:3100/loki/api/v1/push\"\n    #username => \"test\"\n    #password => \"test\"\n  }\n  # stdout { codec => rubydebug }\n}"` |  |
| loki.enabled | bool | `true` |  |
| minio.enabled | bool | `false` |  |
| modeld.enabled | bool | `false` |  |
| prometheus.enabled | bool | `false` |  |
| promtail.enabled | bool | `false` |  |

