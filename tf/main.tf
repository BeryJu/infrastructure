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
      version = "4.8.0"
    }
    vault = {
      source  = "hashicorp/vault"
      version = "3.3.1"
    }
  }
}

provider "vault" {
}

data "vault_aws_access_credentials" "creds" {
  backend = "aws"
  role    = "admin"
}

provider "aws" {
  region     = "eu-central-1"
  access_key = data.vault_aws_access_credentials.creds.access_key
  secret_key = data.vault_aws_access_credentials.creds.secret_key
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
  source     = "./aws_ses_forwarder/"
  access_key = data.vault_aws_access_credentials.creds.access_key
  secret_key = data.vault_aws_access_credentials.creds.secret_key
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
module "vms" {
  source = "./vms/"
}
