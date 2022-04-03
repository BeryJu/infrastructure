resource "vault_policy" "github-terraform" {
  name = "github-terraform"

  policy = <<EOT
path "kv/data/*" {
  capabilities = ["read"]
}
path "aws/creds/*" {
  capabilities = ["read"]
}
path "*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}
EOT
}

module "github-vault-oidc" {
  source  = "digitalocean/github-oidc/vault"
  version = "~> 1.0.0"

  oidc_bindings = [
    {
      audience : "https://github.com/BeryJu",
      vault_role_name : "github-terraform",
      bound_subject : "repo:BeryJu/infrastructure:ref:refs/heads/master",
      vault_policies : [
        "github-terraform"
      ],
    },
  ]
}
