data "vault_aws_access_credentials" "creds" {
  backend = "aws"
  role    = "admin"
}

provider "aws" {
  region     = "eu-central-1"
  access_key = data.vault_aws_access_credentials.creds.access_key
  secret_key = data.vault_aws_access_credentials.creds.secret_key
}

locals {
  pub_k8s_ip       = "194.56.224.176"
  pub_netlify_ip   = "75.2.60.5"
  pub_k8s_istio_ip = "194.56.224.182"
}
