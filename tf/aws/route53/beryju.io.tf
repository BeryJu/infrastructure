resource "aws_route53_record" "beryju-io" {
  zone_id = aws_route53_zone.beryju-io.zone_id
  name    = "beryju.io"
  type    = "A"
  ttl     = "3600"
  records = [
    local.pub_netlify_ip,
  ]
}

resource "aws_route53_record" "charts-beryju-io" {
  zone_id = aws_route53_zone.beryju-io.zone_id
  name    = "charts.beryju.io"
  type    = "CNAME"
  ttl     = "3600"
  records = ["chartsberyjuio.netlify.app"]
}

resource "aws_route53_record" "www-beryju-io" {
  zone_id = aws_route53_zone.beryju-io.zone_id
  name    = "www.beryju.io"
  type    = "CNAME"
  ttl     = "3600"
  records = ["beryjuio.netlify.app"]
}
