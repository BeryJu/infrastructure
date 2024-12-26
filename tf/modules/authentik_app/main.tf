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

resource "authentik_provider_proxy" "provider" {
  name                         = "tf-${lower(var.name)}"
  internal_host                = var.internal == "" ? null : var.internal
  external_host                = var.external
  mode                         = var.internal == "" ? "forward_single" : "proxy"
  authorization_flow           = data.authentik_flow.default-authorization-flow.id
  invalidation_flow            = data.authentik_flow.default-provider-invalidation-flow.id
  skip_path_regex              = var.skip_path_regex
  internal_host_ssl_validation = var.internal_host_ssl_validation
  jwt_federation_sources       = var.jwt_federation_sources
  access_token_validity        = "hours=8"
}

resource "authentik_application" "app" {
  name              = var.name
  slug              = replace(lower(var.name), " ", "-")
  protocol_provider = authentik_provider_proxy.provider.id
  meta_icon         = var.icon_url
  meta_publisher    = var.meta_publisher
  group             = var.group
}

resource "authentik_policy_binding" "app-access" {
  for_each = toset(var.access_group)
  target   = authentik_application.app.uuid
  group    = each.key
  order    = index(var.access_group, each.key) + 100
}
