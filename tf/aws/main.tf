data "vault_generic_secret" "aws_auth" {
  path = "kv/aws/tf"
}

provider "aws" {
  region     = "us-east-1"
  access_key = data.vault_generic_secret.aws_auth.data["access_key"]
  secret_key = data.vault_generic_secret.aws_auth.data["secret_key"]
}

resource "aws_vpc" "main" {
  cidr_block = "10.121.0.0/16"
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.121.0.0/24"

  tags = {
    Name = "Default"
  }
}
