terraform {
  required_providers {
    grafana = {
      source  = "grafana/grafana"
      version = "1.31.1"
    }
    http = {
      source  = "hashicorp/http"
      version = "3.2.1"
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
