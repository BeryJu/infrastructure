data "vault_generic_secret" "aws_auth" {
  path = "kv/aws/route53"
}

provider "aws" {
  region = "us-east-1"
  access_key = data.vault_generic_secret.aws_auth.data["access_key"]
  secret_key = data.vault_generic_secret.aws_auth.data["secret_key"]
}

locals {
  pub_k8s_ip = "194.56.224.176"
  pub_adc_ip = "194.56.224.150"
}
