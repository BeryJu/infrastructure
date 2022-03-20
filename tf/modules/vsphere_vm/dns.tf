data "aws_route53_zone" "forward" {
  name         = local.domain
  private_zone = true
}

data "aws_route53_zone" "reverse" {
  name         = "120.10.in-addr.arpa"
  private_zone = true
}

locals {
  rev = join(".", reverse(split(".", vsphere_virtual_machine.vm.default_ip_address)))
}

resource "aws_route53_record" "vm" {
  zone_id = data.aws_route53_zone.forward.zone_id
  name    = var.name
  type    = "A"
  ttl     = "300"
  records = [vsphere_virtual_machine.vm.default_ip_address]
}

resource "aws_route53_record" "vm-reverse" {
  zone_id = data.aws_route53_zone.reverse.zone_id
  name    = "${local.rev}.in-addr.arpa"
  type    = "PTR"
  ttl     = "300"
  records = [var.name]
}
