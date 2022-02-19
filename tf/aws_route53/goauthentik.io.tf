resource "aws_route53_record" "goauthentik-main" {
  zone_id = aws_route53_zone.goauthentik-io.zone_id
  name    = "goauthentik.io"
  type    = "A"
  ttl     = "300"
  records = [
    local.pub_netlify_ip,
  ]
}
resource "aws_route53_record" "goauthentik-wildcard" {
  zone_id = aws_route53_zone.goauthentik-io.zone_id
  name    = "*.goauthentik.io"
  type    = "CNAME"
  ttl     = "300"
  records = ["authentik.netlify.app."]
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
resource "aws_route53_record" "goauthentik-my" {
  zone_id = aws_route53_zone.goauthentik-io.zone_id
  name    = "*.my.goauthentik.io"
  type    = "CNAME"
  ttl     = "300"
  records = [aws_route53_record.k8s-istio.fqdn]
}
