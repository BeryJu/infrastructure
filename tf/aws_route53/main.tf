data "vault_aws_access_credentials" "creds" {
  backend = "aws"
  role    = "route53"
}

provider "aws" {
  region     = "eu-central-1"
  access_key = data.vault_aws_access_credentials.creds.access_key
  secret_key = data.vault_aws_access_credentials.creds.secret_key
}

locals {
  pub_k8s_ip = "194.56.224.176"
  pub_adc_ip = "194.56.224.150"
}
