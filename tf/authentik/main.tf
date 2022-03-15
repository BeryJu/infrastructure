terraform {
  required_providers {
    authentik = {
      source  = "goauthentik/authentik"
      version = "2022.3.1"
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

data "authentik_certificate_key_pair" "generated" {
  name = "authentik self-signed v2"
}

data "authentik_flow" "default-authorization-flow" {
  slug = "default-provider-authorization-implicit-consent"
}

resource "authentik_service_connection_kubernetes" "local" {
  name  = "Local Kubernetes Cluster"
  local = true
}

resource "authentik_outpost" "k8s-proxy" {
  name = "k8s"
  protocol_providers = [
    63,
    59,
    65,
    67,
    27,
    module.authentik-app-puppetboard.provider_ia,
  ]
  service_connection = authentik_service_connection_kubernetes.local.id
}
