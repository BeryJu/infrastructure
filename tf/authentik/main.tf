terraform {
  required_providers {
    authentik = {
      source  = "goauthentik/authentik"
      version = "0.3.0"
    }
  }
}

data "vault_generic_secret" "authentik_auth" {
  path = "kv/services/authentik-prod"
}

provider "authentik" {
  url   = "https://id.beryju.org"
  token = data.vault_generic_secret.authentik_auth.data["terraform_token"]
}

data "authentik_group" "acl_beryjuorg" {
  name = "_acl_pb_beryjuorg"
}
