terraform {
  required_providers {
    grafana = {
      source  = "grafana/grafana"
      version = "3.22.0"
    }
    http = {
      source  = "hashicorp/http"
      version = "3.4.5"
    }
  }
}

data "vault_generic_secret" "grafana_auth" {
  path = "kv/services/grafana"
}

provider "grafana" {
  url  = "https://grafana.lab.beryju.io"
  auth = data.vault_generic_secret.grafana_auth.data["terraform_token"]
}

resource "grafana_dashboard" "home" {
  config_json = file("${path.module}/custom/home.json")
}
