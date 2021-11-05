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
      version = "3.64.2"
    }
    vault = {
      source  = "hashicorp/vault"
      version = "2.24.1"
    }
  }
}

provider "vault" {
}

module "artifactory" {
  source = "./artifactory/"
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
