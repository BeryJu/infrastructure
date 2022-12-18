module "ses-beryju-org" {
  source = "../modules/aws_ses_domain"
  domain = "beryju.org"
}

module "ses-beryju-io" {
  source = "../modules/aws_ses_domain"
  domain = "beryju.io"
}

resource "aws_ses_receipt_rule_set" "main" {
  rule_set_name = "ses-rule-set"
}

resource "aws_ses_receipt_rule" "store" {
  name          = "ses-forwarder"
  rule_set_name = resource.aws_ses_receipt_rule_set.main.rule_set_name
  recipients = [
    "ukch.at",
    ".ukch.at",
    "fixsuutarila.com",
    "beryju.io",
  ]
  enabled      = true
  scan_enabled = true

  s3_action {
    bucket_name = resource.aws_s3_bucket.bucket.id
    position    = 1
  }

  lambda_action {
    function_arn    = resource.aws_lambda_function.email-forwader.arn
    invocation_type = "Event"
    position        = 2
  }
}
