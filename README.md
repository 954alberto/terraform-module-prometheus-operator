## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| backend\_dns | DNS of the ingress. | string | n/a | yes |
| chart\_version | Version of the prometheus operator chart to install | string | `"5.10.5"` | no |
| custom\_rule\_files\_count | The number of custom files with default rules you want to deploy | string | n/a | yes |
| custom\_rule\_files\_names | List the name of all the custom rule files you want to deploy | list | n/a | yes |
| customer | Name of the customer team using the cluster. | string | n/a | yes |
| default\_rules\_values | Values file for default rules release | string | n/a | yes |
| environment | The environment of the cluster - acc | prod | string | n/a | yes |
| grafana\_chart\_version | Version of grafana chart to install | string | `"3.8.3"` | no |
| helm\_values\_grafana | helm values to add | string | n/a | yes |
| helm\_values\_prometheus-operator | helm values to add | string | n/a | yes |
| letsencrypt | Cluster issuer to use for provisioning certs. | string | n/a | yes |
| namespace | Kubernetes namespace to be deployed in. | string | n/a | yes |
| okta\_environment | Only two okta environments available - `-emea` for production and `preview for acceptance. | string | n/a | yes |
| okta\_group\_id | The group ID of the team to use of auth in Okta | string | n/a | yes |
| okta\_tenant | Name of the okta tenant - `schubergphilis` or `bkwi` or any other tenant. | string | n/a | yes |
| rules\_chart\_version | Version of the prometheus operator rules chart to install | string | `"1.2.1"` | no |
| target\_cluster | Kubernetes cluster to be deployed in. | string | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| name | Name of the release |
| namespace | Kubernetes namespace of the release |
| password | Grafana admin password |
| version | Version of the chart |

## Providers

| Name | Version |
|------|---------|
| helm | n/a |
| kubernetes | n/a |
| random | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| chart\_version | Version of the prometheus operator chart to install | `string` | `"8.12.2"` | no |
| custom\_rule\_files\_count | The number of custom files with default rules you want to deploy | `any` | n/a | yes |
| custom\_rule\_files\_names | List the name of all the custom rule files you want to deploy | `list(string)` | n/a | yes |
| customer | Name of the customer team using the cluster. | `any` | n/a | yes |
| default\_rules\_values | Values file for default rules release | `any` | n/a | yes |
| environment | The environment of the cluster - acc \| prod | `any` | n/a | yes |
| helm\_values\_prometheus-operator | helm values to add | `any` | n/a | yes |
| letsencrypt | Cluster issuer for provisioning certs. | `string` | `"letsencrypt-mcp-dns"` | no |
| logging | Enable or disable logging stack - Fluend, Elasticsearch and Kibana | `number` | `0` | no |
| namespace | Kubernetes namespace to be deployed in. | `any` | n/a | yes |
| release\_name | Name of the release | `string` | `"prometheus-operator"` | no |
| rules\_chart\_version | Version of the prometheus operator rules chart to install | `string` | `"3.0.0"` | no |
| target\_cluster | Kubernetes cluster to be deployed in. | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| name | Name of the release |
| namespace | Kubernetes namespace of the release |
| password | Grafana admin password |
| version | Version of the chart |

