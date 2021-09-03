terraform {
  required_providers {
    grafana = {
      source  = "grafana/grafana"
      version = "1.13.4"
    }
    http = {
      source  = "hashicorp/http"
      version = "2.1.0"
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
