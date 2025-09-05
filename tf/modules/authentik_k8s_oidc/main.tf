terraform {
  required_providers {
    authentik = {
      source = "goauthentik/authentik"
    }
  }
}

data "authentik_flow" "default-authorization-flow" {
  slug = "default-provider-authorization-implicit-consent"
}

data "authentik_flow" "default-provider-invalidation-flow" {
  slug = "default-provider-invalidation-flow"
}

data "authentik_property_mapping_provider_scope" "scopes" {
  managed_list = [
    "goauthentik.io/providers/oauth2/scope-openid",
    "goauthentik.io/providers/oauth2/scope-profile",
    "goauthentik.io/providers/oauth2/scope-offline_access",
  ]
}

data "authentik_certificate_key_pair" "generated" {
  name = "authentik self-signed v2"
}

resource "authentik_provider_oauth2" "cluster" {
  name                  = "k8s-cluster-${var.name}"
  authorization_flow    = data.authentik_flow.default-authorization-flow.id
  invalidation_flow     = data.authentik_flow.default-provider-invalidation-flow.id
  client_id             = "k8s-cluster-${var.name}"
  signing_key           = data.authentik_certificate_key_pair.generated.id
  client_type           = "public"
  property_mappings     = concat(var.property_mappings, data.authentik_property_mapping_provider_scope.scopes.ids)
  allowed_redirect_uris = []
  jwt_federation_providers = [
    122
  ]
  lifecycle {
    ignore_changes = [client_secret]
  }
}

resource "authentik_application" "cluster" {
  name              = "Kubernetes Cluster ${var.name}"
  slug              = "k8s-${var.name}"
  protocol_provider = authentik_provider_oauth2.cluster.id
}

resource "authentik_policy_binding" "cluster-access" {
  for_each = toset(var.access_group)
  target   = authentik_application.cluster.uuid
  group    = each.key
  order    = index(var.access_group, each.key) + 100
}
