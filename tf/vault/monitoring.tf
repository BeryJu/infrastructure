resource "vault_policy" "monitoring" {
  name = "monitoring"

  policy = <<EOT
path "sys/metrics" {
  capabilities = ["read"]
}
EOT
}
