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

module "route53" {
  source = "./route53/"
}
