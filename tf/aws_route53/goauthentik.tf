resource "aws_route53_record" "goauthentik-main" {
  zone_id = aws_route53_zone.goauthentik-io.zone_id
  name    = "goauthentik.io"
  type    = "A"
  ttl     = "300"
  records = ["104.198.14.52"]
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
  records = [aws_route53_record.k8s.fqdn]
}
