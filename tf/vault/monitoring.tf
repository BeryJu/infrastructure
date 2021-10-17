resource "vault_policy" "monitoring" {
  name = "monitoring"

  policy = <<EOT
path "sys/metrics" {
  capabilities = ["read"]
}
EOT
}

resource "vault_token" "monitoring-token" {
  role_name = "app"

  policies = [vault_policy.monitoring.name]

  renewable = true
  ttl = "30d"
}

resource "vault_generic_secret" "monitoring-token-secret" {
  path = "kv/services/prometheus/vault"

  data_json = <<EOT
{
  "token": "${vault_token.monitoring-token.client_token}",
}
EOT
}
