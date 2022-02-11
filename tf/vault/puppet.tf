resource "vault_auth_backend" "puppet-cert" {
  type = "cert"
  path = "puppet-cert"
}

resource "vault_cert_auth_backend_role" "puppet-root" {
  name           = "puppet"
  certificate    = file("./vault/files/puppet.pem")
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
EOT
}
