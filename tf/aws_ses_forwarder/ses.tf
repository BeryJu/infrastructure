module "ses-beryju-org" {
  source = "../modules/aws_ses_domain"
  domain = "beryju.org"
}

module "ses-goauthentik-io" {
  source = "../modules/aws_ses_domain"
  domain = "goauthentik.io"
}

module "ses-beryju-io" {
  source = "../modules/aws_ses_domain"
  domain = "beryju.io"
}
