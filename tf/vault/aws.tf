resource "vault_aws_secret_backend_role" "role-route53" {
  backend         = "aws"
  name            = "route53"
  credential_type = "iam_user"

  policy_document = file("./vault/policies/route53.json")
}

resource "vault_aws_secret_backend_role" "role-ses" {
  backend         = "aws"
  name            = "ses-send"
  credential_type = "iam_user"

  policy_document = file("./vault/policies/ses-send.json")
}

resource "vault_aws_secret_backend_role" "role-admin" {
  backend         = "aws"
  name            = "admin"
  credential_type = "iam_user"

  policy_document = file("./vault/policies/admin.json")
}
