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

resource "authentik_provider_proxy" "provider" {
  name               = "tf-${lower(var.name)}"
  internal_host      = var.internal
  external_host      = var.external
  authorization_flow = data.authentik_flow.default-authorization-flow.id
  token_validity     = "days=30"
  skip_path_regex    = var.skip_path_regex
}

resource "authentik_application" "app" {
  name              = var.name
  slug              = replace(lower(var.name), " ", "-")
  protocol_provider = authentik_provider_proxy.provider.id
  meta_icon         = var.icon_url
  group             = var.group
}

resource "authentik_policy_binding" "app-access" {
  for_each = toset(var.access_group)
  target   = authentik_application.app.uuid
  group    = each.key
  order    = index(var.access_group, each.key) + 100
}
