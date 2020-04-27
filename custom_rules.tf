resource "helm_release" "prometheus-operator-custom" {
  depends_on = [helm_release.prometheus-operator-init]
  count      = var.custom_rule_files_count
  namespace  = var.namespace
  name       = "prometheus-operator-custom-rules-${count.index}"
  chart      = "sbp/anything"
  version    = "1.0.0"
  values = [file(
    "${path.cwd}/templates/prometheus-rules/${element(var.custom_rule_files_names, count.index)}",
  )]

  set_string {
    name  = "apiVersion"
    value = "monitoring.coreos.com/v1"
  }

  set_string {
    name  = "kind"
    value = "PrometheusRule"
  }

  set_string {
    name  = "metadata.name"
    value = "prometheus-operator-custom-rules-${count.index}"
  }

  set_string {
    name  = "metadata.namespace"
    value = var.namespace
  }

  set_string {
    name  = "metadata.labels.prometheusInstance"
    value = "mcp"
  }
}

