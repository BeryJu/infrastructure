terraform {
  required_providers {
    rancher2 = {
      source  = "rancher/rancher2"
      version = "1.24.1"
    }
  }
}

data "vault_generic_secret" "rancher_auth" {
  path = "kv/services/rancher/terraform"
}

provider "rancher2" {
  api_url    = "https://rancher.beryju.org"
  access_key = data.vault_generic_secret.rancher_auth.data["access_key"]
  secret_key = data.vault_generic_secret.rancher_auth.data["secret_key"]
}

resource "rancher2_cluster" "beryjuorg-prd" {
  name = "beryjuorg-prd"

  lifecycle {
    ignore_changes = [cluster_monitoring_input, labels]
  }
}

resource "rancher2_cluster" "beryjuorg-offsite" {
  name = "beryjuorg-offsite"
  k3s_config {
    version = "v1.23.4+k3s1"
  }

  lifecycle {
    ignore_changes = [cluster_monitoring_input, labels]
  }
}

resource "rancher2_cluster" "beryjuorg-defr" {
  name                         = "beryjuorg-defr"
  cluster_template_id          = "cattle-global-data:ct-mjm92"
  cluster_template_revision_id = "cattle-global-data:ctr-wh4hg"

  lifecycle {
    ignore_changes = [cluster_monitoring_input, labels]
  }
}
