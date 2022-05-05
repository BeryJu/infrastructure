module "napp-prd1" {
  source  = "../modules/net_machine"
  fqdn    = "nappclprd1.prod.beryju.org"
  address = "10.120.0.160"
  additional_hosts = [
    {
      fqdn    = "nappclprd1n1.prod.beryju.org"
      address = "10.120.0.161"
    }
  ]
}

module "vcenter" {
  source  = "../modules/net_machine"
  fqdn    = "vc1.prod.beryju.org"
  address = "10.120.0.2"
}
