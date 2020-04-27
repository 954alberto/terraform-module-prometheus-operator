variable "release_name" {
  description = "Name of the release"
  default     = "prometheus-operator"
}

variable "environment" {
  description = "The environment of the cluster - acc | prod"
}

variable "namespace" {
  description = "Kubernetes namespace to be deployed in."
}

variable "target_cluster" {
  description = "Kubernetes cluster to be deployed in."
}

variable "chart_version" {
  description = "Version of the prometheus operator chart to install"
  default     = "8.12.2" 
}

variable "rules_chart_version" {
  description = "Version of the prometheus operator rules chart to install"
  default     = "3.0.0"
}

variable "letsencrypt" {
  description = "Cluster issuer for provisioning certs."
  default     = "letsencrypt-mcp-dns"
}

variable "helm_values_prometheus-operator" {
  description = "helm values to add"
}

variable "default_rules_values" {
  description = "Values file for default rules release"
}

variable "customer" {
  description = "Name of the customer team using the cluster."
}

variable "custom_rule_files_count" {
  description = "The number of custom files with default rules you want to deploy"
}

variable "custom_rule_files_names" {
  description = "List the name of all the custom rule files you want to deploy"
  type        = list(string)
}

variable "logging" {
  description = "Enable or disable logging stack - Fluend, Elasticsearch and Kibana"
  default     = 0
}
