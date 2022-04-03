resource "vault_auth_backend" "puppet-cert" {
  type = "cert"
  path = "cert"
}

resource "vault_cert_auth_backend_role" "puppet-root" {
  name           = "puppet"
  certificate    = file("${path.module}/files/puppet.pem")
  backend        = vault_auth_backend.puppet-cert.path
  token_ttl      = 3600
  token_policies = ["puppet-node"]
}

resource "vault_policy" "puppet-node" {
  name = "puppet-node"

  policy = <<EOT
path "kv/data/*" {
  capabilities = ["read"]
}
path "aws/creds/*" {
  capabilities = ["read"]
}
path "auth/token/*" {
  capabilities = ["update"]
}
EOT
}
