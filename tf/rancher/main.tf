terraform {
  required_providers {
    rancher2 = {
      source  = "rancher/rancher2"
      version = "1.15.1"
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
}

resource "rancher2_cluster" "beryjuorg-backup" {
  name = "beryjuorg-backup"
  k3s_config {
    version = "v1.19.4+k3s1"
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
