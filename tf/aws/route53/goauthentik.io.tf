resource "aws_route53_record" "goauthentik-main" {
  zone_id = aws_route53_zone.goauthentik-io.zone_id
  name    = "goauthentik.io"
  type    = "A"
  ttl     = "300"
  records = [
    local.pub_netlify_ip,
  ]
}

locals {
  versions = [
    "version-0-13",
    "version-0-14",
    "version-2021-1",
    "version-2021-2",
    "version-2021-3",
    "version-2022-2",
    "version-2022-3",
    "version-2022-5",
    "version-2022-6",
    "version-2022-7",
    "version-2022-8",
    "version-2022-9",
    "version-2022-10",
  ]
}

resource "aws_route53_record" "goauthentik-version-branch" {
  zone_id = aws_route53_zone.goauthentik-io.zone_id
  name    = "${each.key}.goauthentik.io"
  type    = "CNAME"
  ttl     = "300"
  records = ["authentik.netlify.app."]
  for_each = toset(local.versions)
}

resource "aws_route53_record" "goauthentik-version" {
  zone_id = aws_route53_zone.goauthentik-io.zone_id
  name    = "version.goauthentik.io"
  type    = "CNAME"
  ttl     = "300"
  records = ["authentik-version.netlify.app"]
}

resource "aws_route53_record" "goauthentik-charts" {
  zone_id = aws_route53_zone.goauthentik-io.zone_id
  name    = "charts.goauthentik.io"
  type    = "CNAME"
  ttl     = "300"
  records = ["goauthentik.github.io"]
}
