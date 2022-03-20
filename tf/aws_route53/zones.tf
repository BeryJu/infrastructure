resource "aws_route53_zone" "beryju-org" {
  name = "beryju.org"
}

resource "aws_route53_zone" "jela-io" {
  name = "jela.io"
}

resource "aws_route53_zone" "goauthentik-io" {
  name = "goauthentik.io"
}

resource "aws_route53_zone" "rev-194-56-224" {
  name = "224.56.194.in-addr.arpa"
}

resource "aws_route53_zone" "ukch-at" {
  name = "ukch.at"
}

resource "aws_route53_zone" "tigs-mom" {
  name = "tigs.mom"
}

data "aws_vpc" "default" {
  tags = {
    Name = "beryjuorg-default"
  }
}

resource "aws_route53_zone" "prod-beryju-org" {
  name = "prod.beryju.org"

  vpc {
    vpc_id = data.aws_vpc.default.id
  }
}

resource "aws_route53_zone" "lab-beryju-org" {
  name = "lab.beryju.org"

  vpc {
    vpc_id = data.aws_vpc.default.id
  }
}

resource "aws_route53_zone" "k8s-beryju-org" {
  name = "k8s.beryju.org"

  vpc {
    vpc_id = data.aws_vpc.default.id
  }
}
