module "ext-backup-s3" {
  source  = "../modules/net_machine"
  fqdn    = "backup-s3.prod.beryju.org"
  address = "202.61.244.145"
}

module "ext-sentry1" {
  source  = "../modules/net_machine"
  fqdn    = "sentry1.prod.beryju.org"
  address = "202.61.239.168"
}
