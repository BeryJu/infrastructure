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
      version = "~> 3.0"
    }
    vault = {
      source  = "hashicorp/vault"
      version = "2.23.0"
    }
  }
}

provider "vault" {
}

module "aws" {
  source = "./aws/"
}
module "aws_route53" {
  source = "./aws_route53/"
}
module "rancher" {
  source = "./rancher/"
}
module "authentik" {
  source = "./authentik/"
}
module "grafana" {
  source = "./grafana/"
}
module "vault" {
  source = "./vault/"
}
