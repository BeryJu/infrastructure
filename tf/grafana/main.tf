terraform {
  required_providers {
    grafana = {
      source  = "grafana/grafana"
      version = "2.19.0"
    }
    http = {
      source  = "hashicorp/http"
      version = "3.4.2"
    }
  }
}

data "vault_generic_secret" "grafana_auth" {
  path = "kv/services/grafana"
}

provider "grafana" {
  url  = "https://grafana.infra.beryju.org/"
  auth = data.vault_generic_secret.grafana_auth.data["terraform_token"]
}

resource "grafana_dashboard" "home" {
  config_json = file("${path.module}/custom/home.json")
}
