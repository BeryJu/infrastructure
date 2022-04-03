module "github-vault-oidc" {
  source  = "digitalocean/github-oidc/vault"
  version = "~> 1.0.0"

  oidc_bindings = [
    {
      audience : "https://github.com/BeryJu",
      vault_role_name : "github-terraform",
      bound_subject : "repo:BeryJu/infrastructure:ref:refs/heads/master",
      vault_policies : [
        "admin"
      ],
    },
  ]
}
