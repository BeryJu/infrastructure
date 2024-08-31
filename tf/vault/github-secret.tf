resource "vault_policy" "github-flux-commit-status" {
  name = "github-flux-commit-status"

  policy = <<EOT
path "github/token" {
  capabilities = ["create"]
  required_parameters = ["installation_id","permissions","repository_ids"]
  allowed_parameters = {
    "installation_id" = ["54263036"]
    "repository_ids" = ["347929503"]
    "permissions" = ["statuses=write"]
  }
}
EOT
}
