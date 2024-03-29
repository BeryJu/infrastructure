data "vault_aws_access_credentials" "creds" {
  backend = "aws"
  type    = "sts"
  role    = "admin-tf"
}

provider "aws" {
  region     = "eu-west-1"
  access_key = data.vault_aws_access_credentials.creds.access_key
  secret_key = data.vault_aws_access_credentials.creds.secret_key
  token      = data.vault_aws_access_credentials.creds.security_token
}

data "archive_file" "lambda_zip" {
  type        = "zip"
  source_dir  = "${path.module}/source"
  output_path = "${path.module}/lambda.zip"
}

resource "aws_lambda_function" "email-forwader" {
  filename         = "${path.module}/lambda.zip"
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256
  function_name    = "beryjuorg-ses-forward"
  role             = "arn:aws:iam::471432361072:role/service-role/beryjuorg-ses-forward-role-vub5mi32"
  handler          = "index.handler"
  publish          = true
  runtime          = "nodejs16.x"
  layers = [
    "arn:aws:lambda:eu-west-1:943013980633:layer:SentryNodeServerlessSDK:159",
  ]
}
