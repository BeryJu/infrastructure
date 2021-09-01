data "vault_auth_backend" "aws" {
  path = "aws"
}

resource "vault_aws_secret_backend_role" "role-route53" {
  backend = data.vault_auth_backend.aws.id
  name    = "route53"
  credential_type = "iam_user"

  policy_document = file("./vault/policies/route53.json")
}

resource "vault_aws_secret_backend_role" "role-ses" {
  backend = data.vault_auth_backend.aws.id
  name    = "ses-send"
  credential_type = "iam_user"

  policy_document = file("./vault/policies/ses-send.json")
}
