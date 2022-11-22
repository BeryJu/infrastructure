terraform {
  required_providers {
    symbiosis = {
      source  = "symbiosis-cloud/symbiosis"
      version = "0.5.0"
    }
    flux = {
      source  = "fluxcd/flux"
      version = "0.21.0"
    }
  }
}

data "vault_generic_secret" "symbiosis" {
  path = "kv/services/symbiosis"
}

provider "symbiosis" {
  api_key = data.vault_generic_secret.symbiosis.data["api"]
}
