resource "vault_policy" "vault-secrets-operator" {
  name = "vault-secrets-operator"

  policy = <<EOT
path "kv/data/*" {
  capabilities = ["read"]
}
path "aws/creds/*" {
  capabilities = ["read"]
}
EOT
}
