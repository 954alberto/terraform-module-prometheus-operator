resource "kubernetes_namespace" "prometheus" {
  metadata {
    name = var.namespace
  }
}

resource "random_password" "password" {
  length  = 10
  special = false
}

data "helm_repository" "stable" {
  name = "stable"
  url  = "https://kubernetes-charts.storage.googleapis.com"
}

data "helm_repository" "sbp" {
  name = "sbp"
  url  = "https://s3-eu-west-1.amazonaws.com/sbp-charts"
}

resource "helm_release" "prometheus-operator-init" {
  depends_on = [kubernetes_namespace.prometheus]
  name       = "prometheus-operator-init"
  namespace  = var.namespace
  chart      = "sbp/prometheus-operator-init"
}

resource "helm_release" "prometheus-operator" {
  depends_on    = [helm_release.prometheus-operator-init]
  namespace     = var.namespace
  name          = var.release_name
  chart         = "stable/prometheus-operator"
  version       = var.chart_version
  recreate_pods = true
  values        = [var.helm_values_prometheus-operator]
}

# Fluentd
data "helm_repository" "kiwigrid" {
  name = "kiwigrid"
  url  = "https://kiwigrid.github.io"
}

resource "helm_release" "fluentd" {
  count         = var.logging
  depends_on    = [helm_release.prometheus-operator]
  namespace     = var.namespace
  name          = "fluentd"
  chart         = "kiwigrid/fluentd-elasticsearch"
  recreate_pods = true

  set {
    name  = "elasticsearch.host"
    value = "elasticsearch-master"
  }
  set {
    name  = "prometheusRule.prometheusNamespace"
    value = var.namespace
  }
  set {
    name  = "prometheusRule.labels.prometheusInstance"
    value = "lptd"
  }
}

# Elasticsearch and Kibana

data "helm_repository" "elastic" {
  name = "elastic"
  url  = "https://helm.elastic.co"
}

resource "helm_release" "elasticsearch" {
  count         = var.logging
  depends_on    = [helm_release.prometheus-operator]
  namespace     = var.namespace
  name          = "elasticsearch"
  chart         = "elastic/elasticsearch"
  recreate_pods = true
}

resource "helm_release" "kibana" {
  count         = var.logging
  depends_on    = [helm_release.prometheus-operator]
  namespace     = var.namespace
  name          = "kibana"
  chart         = "elastic/kibana"
  recreate_pods = true
}