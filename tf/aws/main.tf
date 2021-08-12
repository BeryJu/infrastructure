data "vault_generic_secret" "aws_auth" {
  path = "kv/aws/tf"
}

provider "aws" {
  region     = "eu-central-1"
  access_key = data.vault_generic_secret.aws_auth.data["access_key"]
  secret_key = data.vault_generic_secret.aws_auth.data["secret_key"]
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
