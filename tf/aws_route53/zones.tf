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
