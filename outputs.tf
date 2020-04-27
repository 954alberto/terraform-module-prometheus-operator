output "password" {
  description = "Grafana admin password"
  value       = random_password.password.result
  sensitive   = true
}

output "name" {
  description = "Name of the release"
  value       = helm_release.prometheus-operator.name
}

output "namespace" {
  description = "Kubernetes namespace of the release"
  value       = helm_release.prometheus-operator.namespace
}

output "version" {
  description = "Version of the chart"
  value       = helm_release.prometheus-operator.version
}

