terraform {
  required_providers {
    linode = {
      source  = "linode/linode"
    }
  }
}

data "vault_generic_secret" "linode" {
  path = "kv/linode"
}

provider "linode" {
  token = data.vault_generic_secret.linode.data["key"]
}
