data "vault_aws_access_credentials" "creds" {
  backend = "aws"
  role    = "admin"
}

provider "aws" {
  region     = "eu-central-1"
  access_key = data.vault_aws_access_credentials.creds.access_key
  secret_key = data.vault_aws_access_credentials.creds.secret_key
}

resource "aws_vpc" "main" {
  cidr_block = "10.121.0.0/16"
  tags = {
    Name = "beryjuorg-default"
  }
}

resource "aws_subnet" "main" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.121.0.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name = "beryjuorg-default"
  }
}
