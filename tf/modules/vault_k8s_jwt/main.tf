terraform {
  required_providers {
    authentik = {
      source = "goauthentik/authentik"
    }
  }
}

# resource "vault_auth_backend" "kubernetes" {
#   type = "jwt"
#   path = var.path
# }

resource "vault_jwt_auth_backend" "config" {
  path                   = var.path
  jwt_validation_pubkeys = [var.jwt_pub]
  bound_issuer           = var.iss

  # https://github.com/hashicorp/terraform-provider-vault/issues/1055
  lifecycle {
    ignore_changes = [jwt_validation_pubkeys]
  }
}

resource "vault_jwt_auth_backend_role" "external-secrets" {
  backend         = vault_jwt_auth_backend.config.path
  user_claim      = "sub"
  role_name       = "external-secrets"
  bound_audiences = [var.aud]
  bound_subject   = "system:serviceaccount:kube-system:external-secrets"
  token_ttl       = 3600
  token_policies  = ["external-secrets"]
  role_type       = "jwt"
}

resource "vault_jwt_auth_backend_role" "cert-manager" {
  backend         = vault_jwt_auth_backend.config.path
  user_claim      = "sub"
  role_name       = "cert-manager"
  bound_audiences = [var.aud]
  bound_subject   = "system:serviceaccount:cert-manager:cert-manager"
  token_ttl       = 3600
  token_policies  = ["cert-manager"]
  role_type       = "jwt"
}

resource "vault_jwt_auth_backend_role" "ddns" {
  backend         = vault_jwt_auth_backend.config.path
  user_claim      = "sub"
  role_name       = "ddns"
  bound_audiences = [var.aud]
  bound_subject   = "system:serviceaccount:istio-system:beryju-io-ddns"
  token_ttl       = 3600
  token_policies  = ["cert-manager"]
  role_type       = "jwt"
}

resource "vault_jwt_auth_backend_role" "flux-notification-controller" {
  backend         = vault_jwt_auth_backend.config.path
  user_claim      = "sub"
  role_name       = "flux-notification-controller"
  bound_audiences = [var.aud]
  bound_subject   = "system:serviceaccount:flux-system:notification-controller"
  token_ttl       = 3600
  token_policies  = ["github-flux-commit-status"]
  role_type       = "jwt"
}

resource "vault_jwt_auth_backend_role" "github-actions-controller" {
  backend         = vault_jwt_auth_backend.config.path
  user_claim      = "sub"
  role_name       = "github-actions-controller"
  bound_audiences = [var.aud]
  bound_subject   = "system:serviceaccount:actions-controller:actions-runner-controller"
  token_ttl       = 3600
  token_policies  = ["github-actions-controller"]
  role_type       = "jwt"
}

resource "vault_jwt_auth_backend_role" "workstation" {
  backend         = vault_jwt_auth_backend.config.path
  user_claim      = "sub"
  role_name       = "workstation"
  bound_audiences = [var.aud]
  bound_subject   = "system:serviceaccount:workstation:workstation"
  token_ttl       = 86400
  token_policies  = ["admin"]
  role_type       = "jwt"
}
