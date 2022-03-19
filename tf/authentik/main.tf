terraform {
  required_providers {
    authentik = {
      source  = "goauthentik/authentik"
      version = "2022.3.2"
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
    module.authentik-app-sabnzbd.provider_ia,
    module.authentik-app-oxidized.provider_ia,
    module.authentik-app-alertmanager.provider_ia,
    module.authentik-app-code-server.provider_ia,
    module.authentik-app-home-assistant.provider_ia,
    module.authentik-app-puppetboard.provider_ia,
    module.authentik-app-stack-storm.provider_ia,
  ]
  service_connection = authentik_service_connection_kubernetes.local.id
}

data "authentik_property_mapping_saml" "defaults" {
  managed_list = [
    "goauthentik.io/providers/saml/upn",
    "goauthentik.io/providers/saml/name",
    "goauthentik.io/providers/saml/email",
    "goauthentik.io/providers/saml/username",
    "goauthentik.io/providers/saml/uid",
    "goauthentik.io/providers/saml/groups",
    "goauthentik.io/providers/saml/ms-windowsaccountname",
  ]
}
