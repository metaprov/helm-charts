# modeld_default_tenant

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.16.0](https://img.shields.io/badge/AppVersion-1.16.0-informational?style=flat-square)

A Helm chart for default tenant

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| adminaccount.create | bool | `true` |  |
| adminaccount.name | string | `"default-admin"` |  |
| aws.create | bool | `true` |  |
| aws.name | string | `"default-aws"` |  |
| aws.secret.accessKey | string | `"amazon-access-key"` |  |
| aws.secret.az | string | `"amazon-az"` |  |
| aws.secret.secretKey | string | `"amazon-secret-key"` |  |
| azure.create | bool | `true` |  |
| azure.name | string | `"default-azure"` |  |
| azure.secret.storageAccessKey | string | `"test"` |  |
| azure.secret.storageAccountName | string | `"test"` |  |
| bucket.create | bool | `true` |  |
| bucket.name | string | `"default-bucket"` |  |
| dataproduct.create | bool | `true` |  |
| dataproduct.name | string | `"default-data-prodcut"` |  |
| digitalocean.create | bool | `true` |  |
| digitalocean.name | string | `"default-digitalocean"` |  |
| digitalocean.secret.region | string | `"do-region"` |  |
| digitalocean.secret.spacesAccessKey | string | `"do-spaces-access-key"` |  |
| digitalocean.secret.spacesAccessSecret | string | `"do-spaces-access-secret"` |  |
| digitalocean.secret.token | string | `"do-token"` |  |
| dockerhub.create | bool | `true` |  |
| dockerhub.name | string | `"default-dockerhub"` |  |
| dockerhub.secret.password | string | `"dockerhub-password"` |  |
| dockerhub.secret.registryHost | string | `"dockerhub-registry"` |  |
| dockerhub.secret.username | string | `"dockerhub-username"` |  |
| email.create | bool | `true` |  |
| email.from | string | `"email-from"` |  |
| email.host | string | `"email-host"` |  |
| email.name | string | `"default-email"` |  |
| email.port | int | `5060` |  |
| email.secret.password | string | `"email-password"` |  |
| email.secret.username | string | `"email-username"` |  |
| email.to | string | `"email-to"` |  |
| gcp.create | bool | `true` |  |
| gcp.name | string | `"default-gcp"` |  |
| gcp.secret.accessKey | string | `"gcp-accesskey"` |  |
| gcp.secret.az | string | `"gcp-az"` |  |
| gcp.secret.keyfile | string | `"gcp-keyfile"` |  |
| gcp.secret.project | string | `"gcp-project"` |  |
| gcp.secret.secretKey | string | `"gcp-secret-key"` |  |
| github.create | bool | `true` |  |
| github.name | string | `"default-github"` |  |
| github.secret.token | string | `"github-token"` |  |
| github.secret.username | string | `"github-username"` |  |
| lab.create | bool | `true` |  |
| lab.name | string | `"default-lab"` |  |
| license.create | bool | `true` |  |
| license.name | string | `"default-license"` |  |
| license.secret.key | string | `"license"` |  |
| minio.create | bool | `true` |  |
| minio.name | string | `"default-minio"` |  |
| minio.secret.accesskey | string | `"minio-access-key"` |  |
| minio.secret.host | string | `"minio-service.default."` |  |
| minio.secret.secretkey | string | `"minio-secret-key"` |  |
| servingsite.create | bool | `true` |  |
| servingsite.fdqn | string | `"serving.modeld.io"` |  |
| servingsite.name | string | `"default-servingsite"` |  |
| slack.create | bool | `true` |  |
| slack.name | string | `"default-slack"` |  |
| slack.secret.token | string | `"slack-token"` |  |
| slack.secret.username | string | `"slack-user"` |  |
| slack.webhook | string | `"hook"` |  |
| tenant.create | bool | `true` |  |
| tenant.name | string | `"default-tenant"` |  |

