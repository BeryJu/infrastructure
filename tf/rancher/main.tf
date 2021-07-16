terraform {
  required_providers {
    rancher2 = {
      source  = "rancher/rancher2"
      version = "1.16.0"
    }
  }
}

data "vault_generic_secret" "rancher_auth" {
  path = "kv/services/rancher/terraform"
}

provider "rancher2" {
  api_url = "https://rancher.beryju.org"
  access_key = data.vault_generic_secret.rancher_auth.data["access_key"]
  secret_key = data.vault_generic_secret.rancher_auth.data["secret_key"]
}

resource "rancher2_cluster" "beryjuorg-prd" {
  name = "beryjuorg-prd"
  cluster_monitoring_input {
    answers = {
      "exporter-kubelets.https"                   = "true"
      "exporter-node.enabled"                     = "true"
      "exporter-node.ports.metrics.port"          = "9796"
      "exporter-node.resources.limits.cpu"        = "200m"
      "exporter-node.resources.limits.memory"     = "200Mi"
      "grafana.persistence.enabled"               = "false"
      "grafana.persistence.size"                  = "10Gi"
      "grafana.persistence.storageClass"          = "default"
      "operator-init.enabled"                     = "true"
      "operator.resources.limits.memory"          = "500Mi"
      "prometheus.persistence.enabled"            = "false"
      "prometheus.persistence.size"               = "50Gi"
      "prometheus.persistence.storageClass"       = "default"
      "prometheus.persistent.useReleaseName"      = "true"
      "prometheus.resources.core.limits.cpu"      = "1000m"
      "prometheus.resources.core.limits.memory"   = "1000Mi"
      "prometheus.resources.core.requests.cpu"    = "750m"
      "prometheus.resources.core.requests.memory" = "750Mi"
      "prometheus.retention"                      = "12h"
    }
  }
}

resource "rancher2_cluster" "beryjuorg-backup" {
  name = "beryjuorg-backup"
  k3s_config {
    version = "v1.19.4+k3s1"
  }

  cluster_monitoring_input {
    answers = {
      "exporter-kubelets.https"                   = "true"
      "exporter-node.enabled"                     = "true"
      "exporter-node.ports.metrics.port"          = "9796"
      "exporter-node.resources.limits.cpu"        = "200m"
      "exporter-node.resources.limits.memory"     = "200Mi"
      "grafana.persistence.enabled"               = "false"
      "grafana.persistence.size"                  = "10Gi"
      "grafana.persistence.storageClass"          = "default"
      "operator-init.enabled"                     = "true"
      "operator.resources.limits.memory"          = "500Mi"
      "prometheus.persistence.enabled"            = "false"
      "prometheus.persistence.size"               = "50Gi"
      "prometheus.persistence.storageClass"       = "default"
      "prometheus.persistent.useReleaseName"      = "true"
      "prometheus.resources.core.limits.cpu"      = "200m"
      "prometheus.resources.core.limits.memory"   = "750Mi"
      "prometheus.resources.core.requests.cpu"    = "150m"
      "prometheus.resources.core.requests.memory" = "500Mi"
      "prometheus.retention"                      = "12h"
    }
  }
}

resource "rancher2_cluster" "beryjuorg-defr" {
  name                         = "beryjuorg-defr"
  cluster_template_id          = "cattle-global-data:ct-mjm92"
  cluster_template_revision_id = "cattle-global-data:ctr-wh4hg"
}

resource "rancher2_cluster" "beryjuorg-ak-dev-k3s" {
  name = "beryjuorg-ak-dev-k3s"
}
