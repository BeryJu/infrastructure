module "net-london1" {
  source  = "../modules/net_machine"
  fqdn    = "london1.net.beryju.org"
  address = "10.120.0.1"
}

module "net-freiburg1" {
  source  = "../modules/net_machine"
  fqdn    = "freiburg1.net.beryju.org"
  address = "10.120.20.1"
}

module "net-freiburg2" {
  source  = "../modules/net_machine"
  fqdn    = "freiburg2.net.beryju.org"
  address = "10.120.20.2"
}

module "net-switch-kitchen" {
  source  = "../modules/net_machine"
  fqdn    = "switch-kitchen.net.beryju.org"
  address = "10.120.20.108"
}

module "net-switch-tv" {
  source  = "../modules/net_machine"
  fqdn    = "switch-tv.net.beryju.org"
  address = "10.120.20.107"
}

module "net-ap-living-room" {
  source  = "../modules/net_machine"
  fqdn    = "ap-living-room.net.beryju.org"
  address = "10.120.20.52"
}
