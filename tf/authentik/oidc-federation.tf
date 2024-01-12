resource "authentik_source_oauth" "int-github" {
  name                = "int-github"
  slug                = "int-github"
  authentication_flow = data.authentik_flow.default-source-authentication.id
  enrollment_flow     = data.authentik_flow.default-source-enrollment.id
  oidc_jwks_url       = "https://token.actions.githubusercontent.com/.well-known/jwks"
  provider_type       = "openidconnect"
  consumer_key        = "foo"
  consumer_secret     = "bar"
  lifecycle {
    ignore_changes = [consumer_key, consumer_secret, access_token_url, authorization_url, profile_url]
  }
}

resource "authentik_source_oauth" "int-gitlab" {
  name                = "int-gitlab"
  slug                = "int-gitlab"
  authentication_flow = data.authentik_flow.default-source-authentication.id
  enrollment_flow     = data.authentik_flow.default-source-enrollment.id

  consumer_key    = "foo"
  consumer_secret = "bar"
  // TODO: This needs to be changed to use in-cluster URLs
  access_token_url    = "https://code.beryju.org/oauth/token"
  authorization_url   = "https://code.beryju.org/oauth/authorize"
  oidc_jwks_url       = "https://code.beryju.org/oauth/discovery/keys"
  oidc_well_known_url = "https://code.beryju.org/.well-known/openid-configuration"
  profile_url         = "https://code.beryju.org/oauth/userinfo"
  provider_type       = "openidconnect"
  lifecycle {
    ignore_changes = [consumer_key, consumer_secret]
  }
}
