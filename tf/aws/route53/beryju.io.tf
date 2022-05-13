resource "aws_route53_record" "beryju-io" {
  zone_id = aws_route53_zone.beryju-io.zone_id
  name    = "beryju.io"
  type    = "A"
  ttl     = "3600"
  records = [
    local.pub_netlify_ip,
  ]
}
