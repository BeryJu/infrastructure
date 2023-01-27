data "authentik_flow" "default-authorization-flow" {
  slug = "default-provider-authorization-implicit-consent"
}

resource "authentik_source_oauth" "k8s" {
  name                = "int-${var.path}"
  slug                = "int-${var.path}"
  authentication_flow = data.authentik_flow.default-authorization-flow.id
  enrollment_flow     = data.authentik_flow.default-authorization-flow.id

  provider_type   = "openidconnect"
  consumer_key    = "foo"
  consumer_secret = "bar"

  access_token_url  = "http://foo"
  authorization_url = "http://foo"
  profile_url       = "http://foo"
  oidc_jwks         = var.jwks

  user_path_template = "goauthentik.io/sources/k8s"
}
