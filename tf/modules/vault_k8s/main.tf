resource "vault_auth_backend" "kubernetes" {
  type = "kubernetes"
  path = var.path
}

resource "vault_kubernetes_auth_backend_config" "config" {
  backend                = vault_auth_backend.kubernetes.path
  kubernetes_host        = var.host
  kubernetes_ca_cert     = var.ca
  token_reviewer_jwt     = var.jwt
  disable_iss_validation = "true"
}

resource "vault_kubernetes_auth_backend_role" "vault-secrets-operator" {
  backend                          = vault_auth_backend.kubernetes.path
  role_name                        = "vault-secrets-operator"
  bound_service_account_names      = ["vault-secrets-operator"]
  bound_service_account_namespaces = ["vault-secrets-operator"]
  token_ttl                        = 3600
  token_policies                   = ["vault-secrets-operator"]
}

resource "vault_kubernetes_auth_backend_role" "workstation" {
  backend                          = vault_auth_backend.kubernetes.path
  role_name                        = "workstation"
  bound_service_account_names      = ["workstation"]
  bound_service_account_namespaces = ["workstation"]
  token_ttl                        = 86400
  token_policies                   = ["admin"]
}
