resource "authentik_provider_oauth2" "home-assistant" {
  name               = "hass-oauth"
  authorization_flow = data.authentik_flow.default-authorization-flow.id
  invalidation_flow  = data.authentik_flow.default-provider-invalidation-flow.id
  client_id          = "kt5maEvbNy6Nhr5UIasOsZbAaxP6Oj0mbRTacnV2"
  property_mappings  = data.authentik_property_mapping_provider_scope.defaults.ids
  signing_key        = data.authentik_certificate_key_pair.generated.id
  allowed_redirect_uris = [
    {
      "matching_mode" = "strict"
      "url"           = "https://hass.beryjuio-home.k8s.beryju.io/auth/openid/callback"
    },
    {
      "matching_mode" = "strict"
      "url"           = "https://hass-ext.beryju.io/auth/openid/callback"
    },
  ]
  lifecycle {
    ignore_changes = [client_secret]
  }
}

resource "authentik_application" "home-assistant" {
  name              = "Home Assistant"
  slug              = "home-assistant"
  group             = "Personal"
  protocol_provider = authentik_provider_oauth2.home-assistant.id
  meta_icon         = "https://public.s3.beryju.io/authentik-icons/home-assistant.svg"
}

resource "authentik_policy_binding" "hass-access" {
  target = authentik_application.home-assistant.uuid
  group  = data.authentik_group.acl_beryjuorg.id
  order  = 0
}
