terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "beryjuorg"

    workspaces {
      name = "infrastructure"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.12.1"
    }
    vault = {
      source  = "hashicorp/vault"
      version = "3.5.0"
    }
  }
}

provider "vault" {
}

data "vault_aws_access_credentials" "creds" {
  backend = "aws"
  role    = "admin-tf"
  type    = "sts"
  ttl     = "60m"
}

provider "aws" {
  region     = "eu-central-1"
  access_key = data.vault_aws_access_credentials.creds.access_key
  secret_key = data.vault_aws_access_credentials.creds.secret_key
  token      = data.vault_aws_access_credentials.creds.security_token
}

module "guacamole" {
  source = "./guacamole/"
}
module "authentik" {
  source = "./authentik/"
}
module "aws" {
  source = "./aws/"
}
module "aws_ses_forwarder" {
  source = "./aws_ses_forwarder/"
}
module "aws_route53" {
  source = "./aws_route53/"
}
module "rancher" {
  source = "./rancher/"
}
module "grafana" {
  source = "./grafana/"
}
module "vault" {
  source = "./vault/"
}
module "k8s" {
  source = "./k8s/"
}
module "vms" {
  source = "./vms/"
}
