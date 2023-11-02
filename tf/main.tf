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
      version = "5.24.0"
    }
    vault = {
      source  = "hashicorp/vault"
      version = "3.22.0"
    }
    authentik = {
      source  = "goauthentik/authentik"
      version = "2023.8.0"
    }
  }
}

provider "vault" {
}

data "vault_generic_secret" "aws" {
  path = "kv/aws/terraform"
}

provider "aws" {
  region     = "eu-central-1"
  access_key = data.vault_generic_secret.aws.data["access_key"]
  secret_key = data.vault_generic_secret.aws.data["secret_key"]
}

data "vault_generic_secret" "authentik_auth" {
  path = "kv/services/authentik-prod"
}

provider "authentik" {
  url   = "https://id.beryju.org"
  token = data.vault_generic_secret.authentik_auth.data["terraform_token"]
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
module "grafana" {
  source = "./grafana/"
}
module "vault" {
  source = "./vault/"
}
module "k8s" {
  source = "./k8s/"
}
module "oci" {
  source = "./oci/"
}
module "linode" {
  source = "./linode/"
}
module "minio-prod" {
  source = "./minio/prod/"
}
module "minio-backup" {
  source = "./minio/backup/"
}
