data "vault_generic_secret" "vault_oidc" {
  path = "kv/services/vault"
}

resource "vault_jwt_auth_backend" "authentik-oidc" {
  path               = "authentik"
  default_role       = "default_role"
  type               = "oidc"
  oidc_discovery_url = "https://id.beryju.io/application/o/hashicorp-vault/"
  oidc_client_id     = "413c74e97eb0002cb1ecb2056ce5844af7c1b63d"
  oidc_client_secret = data.vault_generic_secret.vault_oidc.data["oauth_secret"]
  bound_issuer       = "https://id.beryju.io/application/o/hashicorp-vault/"
  tune {
    default_lease_ttl  = "24h"
    listing_visibility = "unauth"
    max_lease_ttl      = "24h"
    token_type         = "default-service"
  }
}

resource "vault_jwt_auth_backend_role" "default_role" {
  backend   = vault_jwt_auth_backend.authentik-oidc.path
  role_name = "default_role"
  role_type = "oidc"
  allowed_redirect_uris = [
    "http://localhost:8250/oidc/callback",
    "https://vault.beryju.io/ui/vault/auth/authentik/oidc/callback"
  ]
  bound_claims_type    = "string"
  groups_claim         = "groups"
  oidc_scopes          = ["openid", "profile", "email"]
  token_policies       = ["admin"]
  user_claim           = "email"
  verbose_oidc_logging = true
}

resource "vault_jwt_auth_backend_role" "jwt_role" {
  backend              = vault_jwt_auth_backend.authentik-oidc.path
  role_name            = "jwt_role"
  role_type            = "jwt"
  bound_claims_type    = "string"
  groups_claim         = "groups"
  token_policies       = ["admin"]
  user_claim           = "email"
  verbose_oidc_logging = true
}
