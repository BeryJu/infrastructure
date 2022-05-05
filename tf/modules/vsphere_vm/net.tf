module "net" {
  source = "../net_machine"

  fqdn    = var.name
  address = vsphere_virtual_machine.vm.default_ip_address
}
