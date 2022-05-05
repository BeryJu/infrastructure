module "napp-bck1" {
  source  = "../modules/net_machine"
  fqdn    = "nappclbck1.prod.beryju.org"
  address = "172.31.189.116"
  additional_hosts = [
    {
      fqdn    = "nappclbck1n1.prod.beryju.org"
      address = "172.31.189.115"
    },
    {
      fqdn    = "nappclbck1n1sp.prod.beryju.org"
      address = "172.31.189.117"
    },
  ]
}

module "esxi-defr" {
  source  = "../modules/net_machine"
  fqdn    = "esxi3.prod.beryju.org"
  address = "10.120.20.20"
}

module "esxi-uk" {
  source  = "../modules/net_machine"
  fqdn    = "esxi4.prod.beryju.org"
  address = "10.120.3.10"
}
