data "vault_aws_access_credentials" "creds" {
  backend = "aws"
  role    = "admin"
}

provider "aws" {
  region     = "eu-west-1"
  access_key = data.vault_aws_access_credentials.creds.access_key
  secret_key = data.vault_aws_access_credentials.creds.secret_key
}

data "archive_file" "lambda_zip" {
  type        = "zip"
  source_dir  = "./aws_ses_forwarder/source"
  output_path = "./aws_ses_forwarder/lambda.zip"
}

resource "aws_s3_bucket" "bucket" {
  bucket = "beryjuorg-ses-forward-prod"
}

resource "aws_lambda_function" "email-forwader" {
  filename         = "./aws_ses_forwarder/lambda.zip"
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256
  function_name    = "beryjuorg-ses-forward"
  role             = "arn:aws:iam::471432361072:role/service-role/beryjuorg-ses-forward-role-vub5mi32"
  handler          = "index.handler"
  publish          = true
  runtime          = "nodejs12.x"
}
