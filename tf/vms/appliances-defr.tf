module "napp-prd2" {
  source  = "../modules/net_machine"
  fqdn    = "nappclprd2.prod.beryju.org"
  address = "10.120.20.160"
  additional_hosts = [
    {
      fqdn    = "nappclprd2n1.prod.beryju.org"
      address = "10.120.20.161"
    }
  ]
}
