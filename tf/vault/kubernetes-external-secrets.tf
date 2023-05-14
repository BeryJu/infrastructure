resource "vault_policy" "external-secrets" {
  name = "external-secrets"

  policy = <<EOT
path "kv/data/*" {
  capabilities = ["read"]
}
EOT
}

resource "vault_policy" "cert-manager" {
  name = "cert-manager"

  policy = <<EOT
path "aws/creds/route53" {
  capabilities = ["read"]
}
EOT
}
