terraform {
  required_providers {
    guacamole = {
      source  = "techBeck03/guacamole"
      version = "1.2.8"
    }
  }
}

data "vault_generic_secret" "guac_auth" {
  path = "kv/services/guacamole/guacadmin"
}

provider "guacamole" {
  url      = "https://guac.beryju.org/guacamole"
  username = data.vault_generic_secret.guac_auth.data["username"]
  password = data.vault_generic_secret.guac_auth.data["password"]
}

# resource "guacamole_user_group" "ak_acl_guacamole" {
#   identifier = "ak_acl_guacamole"
#   system_permissions = ["ADMINISTER"]
# }
