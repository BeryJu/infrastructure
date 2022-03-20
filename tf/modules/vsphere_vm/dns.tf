data "aws_route53_zone" "dns-zone" {
  name         = local.domain
  private_zone = true
}

resource "aws_route53_record" "vm" {
  zone_id = data.aws_route53_zone.dns-zone.zone_id
  name    = var.name
  type    = "A"
  ttl     = "300"
  records = [vsphere_virtual_machine.vm.default_ip_address]
}
