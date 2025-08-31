resource "vault_policy" "monitoring" {
  name = "monitoring"

  policy = <<EOT
path "sys/metrics" {
  capabilities = ["read"]
}

path "auth/token/create" {
  capabilities = ["update"]
}
EOT
}
