terraform {
  backend "s3" {
    bucket = "beryjuorg-tf-state-primary"
    key    = "default"
    region = "eu-central-1"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.2.0"
    }
    vault = {
      source  = "hashicorp/vault"
      version = "3.3.0"
    }
  }
}

provider "vault" {
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
module "vms" {
  source = "./vms/"
}
