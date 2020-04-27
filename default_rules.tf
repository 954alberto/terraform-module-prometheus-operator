resource "helm_release" "prometheus-operator-default" {
  depends_on = [helm_release.prometheus-operator-init]
  namespace  = var.namespace
  name       = "prometheus-operator-default-rules"
  chart      = "sbp/prometheus-operator-rules"
  version    = var.rules_chart_version
  values     = [var.default_rules_values]
}

