terraform {
  required_providers {
    authentik = {
      source = "goauthentik/authentik"
    }
  }
}

data "authentik_group" "acl_beryjuorg" {
  name = "acl_beryjuorg"
}

data "authentik_certificate_key_pair" "generated" {
  name = "authentik self-signed v2"
}

data "authentik_flow" "default-authorization-flow" {
  slug = "default-provider-authorization-implicit-consent"
}

data "authentik_flow" "default-provider-invalidation-flow" {
  slug = "default-provider-invalidation-flow"
}

data "authentik_flow" "default-source-authentication" {
  slug = "default-source-authentication"
}

data "authentik_flow" "default-source-enrollment" {
  slug = "default-source-enrollment"
}

resource "authentik_service_connection_kubernetes" "local" {
  name  = "Local Kubernetes Cluster"
  local = true
}

resource "authentik_outpost" "embedded" {
  name = "authentik Embedded Outpost"
  protocol_providers = [
    module.authentik-app-alertmanager.provider_id,
    module.authentik-app-sabnzbd.provider_id,
    module.authentik-app-radarr.provider_id,
    module.authentik-app-sonarr.provider_id,
    module.authentik-app-oxidized.provider_id,
    module.authentik-app-taskin.provider_id,
  ]
  service_connection = authentik_service_connection_kubernetes.local.id
}

resource "authentik_outpost" "k8s-proxy" {
  name = "k8s"
  protocol_providers = [
    module.authentik-app-home-assistant.provider_id,
    module.authentik-app-tautulli.provider_id,
    module.authentik-app-mimir.provider_id,
    module.authentik-app-loki.provider_id,
  ]
  service_connection = authentik_service_connection_kubernetes.local.id
}

data "authentik_property_mapping_provider_saml" "defaults" {
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
