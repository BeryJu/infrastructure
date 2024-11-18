terraform {
  required_providers {
    gravity = {
      source  = "BeryJu/gravity"
      version = "0.3.4"
    }
  }
}

data "vault_generic_secret" "gravity_auth" {
  path = "kv/services/gravity"
}

locals {
  gravity_default_uid = "managed-by-terraform"
}

provider "gravity" {
  url   = "http://gravity-defr1.prod.beryju.org:8008"
  token = data.vault_generic_secret.gravity_auth.data["api_key"]
}
