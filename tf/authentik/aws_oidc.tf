data "authentik_property_mapping_provider_scope" "aws_oidc" {
  managed_list = [
    "goauthentik.io/providers/oauth2/scope-email",
    "goauthentik.io/providers/oauth2/scope-openid",
    "goauthentik.io/providers/oauth2/scope-profile",
  ]
}

resource "authentik_provider_oauth2" "aws-oidc" {
  name               = "aws-oidc"
  client_id          = "aws-oidc"
  authorization_flow = data.authentik_flow.default-authorization-flow.id
  invalidation_flow  = data.authentik_flow.default-provider-invalidation-flow.id
  property_mappings  = data.authentik_property_mapping_provider_scope.aws_oidc.ids
  signing_key        = data.authentik_certificate_key_pair.generated.id
}

resource "authentik_application" "aws-oidc" {
  name               = "AWS OIDC"
  slug               = "aws-oidc"
  protocol_provider  = authentik_provider_oauth2.aws-oidc.id
  policy_engine_mode = "all"
}

resource "authentik_policy_binding" "aws-oidc-access" {
  target = authentik_application.aws-oidc.uuid
  group  = data.authentik_group.acl_beryjuorg.id
  order  = 0
}

data "authentik_provider_oauth2_config" "aws-oidc-metadata" {
  provider_id = authentik_provider_oauth2.aws-oidc.id
}

resource "aws_iam_openid_connect_provider" "aws-oidc" {
  url = data.authentik_provider_oauth2_config.aws-oidc-metadata.issuer_url

  client_id_list = [
    authentik_provider_oauth2.aws-oidc.client_id,
  ]

  thumbprint_list = [
    replace(data.authentik_certificate_key_pair.generated.fingerprint1, ":", "")
  ]
}
