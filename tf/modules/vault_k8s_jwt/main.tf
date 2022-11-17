resource "vault_auth_backend" "kubernetes" {
  type = "jwt"
  path = var.path
}

resource "vault_jwt_auth_backend" "config" {
  path                   = vault_auth_backend.kubernetes.path
  jwt_validation_pubkeys = [var.jwt_pub]
  bound_issuer           = var.iss
}

resource "vault_jwt_auth_backend_role" "vault-secrets-operator" {
  backend         = vault_auth_backend.kubernetes.path
  user_claim      = "sub"
  role_name       = "vault-secrets-operator"
  bound_audiences = [var.aud]
  bound_subject   = "system:serviceaccount:vault-secrets-operator:vault-secrets-operator"
  token_ttl       = 3600
  token_policies  = ["vault-secrets-operator"]
  role_type       = "jwt"
}

resource "vault_jwt_auth_backend_role" "workstation" {
  backend         = vault_auth_backend.kubernetes.path
  user_claim      = "sub"
  role_name       = "workstation"
  bound_audiences = [var.aud]
  bound_subject   = "system:serviceaccount:workstation:workstation"
  token_ttl       = 86400
  token_policies  = ["admin"]
  role_type       = "jwt"
}
