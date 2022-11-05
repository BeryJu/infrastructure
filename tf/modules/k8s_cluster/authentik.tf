data "http" "jwks" {
  url = "https://${symbiosis_cluster.cluster.endpoint}/openid/v1/jwks"
  request_headers = {
    Authorization = "Bearer ${symbiosis_cluster_service_account.terraform.token}"
  }
  ca_cert_pem = symbiosis_cluster.cluster.ca_certificate
}

data "authentik_flow" "default-authorization-flow" {
  slug = "default-provider-authorization-implicit-consent"
}

resource "authentik_source_oauth" "k8s" {
  name                = "int-k8s-${var.name}"
  slug                = "int-k8s-${var.name}"
  authentication_flow = data.authentik_flow.default-authorization-flow.id
  enrollment_flow     = data.authentik_flow.default-authorization-flow.id

  provider_type   = "openidconnect"
  consumer_key    = "foo"
  consumer_secret = "bar"

  access_token_url  = "http://foo"
  authorization_url = "http://foo"
  profile_url       = "http://foo"
  oidc_jwks         = jsonencode(data.http.jwks.response_body)

  user_path_template = "goauthentik.io/sources/k8s"
}
