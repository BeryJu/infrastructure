module "plex" {
  source = "../modules/vsphere_vm"
  name   = "plex1.prod.beryju.org"
  vsphere = {
    resource_pool = data.vsphere_resource_pool.de-general.id
    datastore     = data.vsphere_datastore_cluster.ssd-freiburg.id
    network       = data.vsphere_network.de-lan.id
    datacenter    = data.vsphere_datacenter.de-freiburg.id
  }

  spec = {
    cpu       = 6
    memory    = 4096
    disk_size = 25
  }
}

module "unifi" {
  source = "../modules/vsphere_vm"
  name   = "unifi1.prod.beryju.org"
  vsphere = {
    resource_pool = data.vsphere_resource_pool.de-general.id
    datastore     = data.vsphere_datastore_cluster.ssd-freiburg.id
    network       = data.vsphere_network.de-lan.id
    datacenter    = data.vsphere_datacenter.de-freiburg.id
  }

  spec = {
    cpu       = 2
    memory    = 2048
    disk_size = 10
  }
}
