resource "vault_policy" "github-terraform" {
  name = "github-terraform"

  policy = <<EOT
path "*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}
EOT
}

module "github-vault-oidc" {
  source  = "digitalocean/github-oidc/vault"
  version = "~> 2.0.0"

  oidc_bindings = [
    {
      audience : "https://github.com/BeryJu",
      vault_role_name : "github-terraform",
      bound_subject : "repo:BeryJu/infrastructure*",
      vault_policies : [
        vault_policy.github-terraform.name
      ],
    },
  ]
}
