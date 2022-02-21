resource "vault_aws_secret_backend_role" "role-route53" {
  backend         = "aws"
  name            = "route53"
  credential_type = "iam_user"

  policy_document = file("${path.module}/policies/route53.json")
}

resource "vault_aws_secret_backend_role" "role-ses" {
  backend         = "aws"
  name            = "ses-send"
  credential_type = "iam_user"

  policy_document = file("${path.module}/policies/ses-send.json")
}

resource "vault_aws_secret_backend_role" "role-admin" {
  backend         = "aws"
  name            = "admin"
  credential_type = "iam_user"

  policy_document = file("${path.module}/policies/admin.json")
}
