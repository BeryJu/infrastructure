module "nas" {
  source = "../modules/vsphere_vm"
  name   = "nas1.prod.beryju.org"
  vsphere = {
    resource_pool = data.vsphere_resource_pool.de-general.id
    datastore     = data.vsphere_datastore_cluster.ssd-freiburg.id
    network       = data.vsphere_network.de-lan.id
    datacenter    = data.vsphere_datacenter.de-freiburg.id
  }

  spec = {
    cpu       = 2
    memory    = 8192
    disk_size = 10
  }
}

module "maas-defr" {
  source = "../modules/vsphere_vm"
  name   = "maas-defr1.prod.beryju.org"
  vsphere = {
    resource_pool = data.vsphere_resource_pool.de-general.id
    datastore     = data.vsphere_datastore_cluster.ssd-freiburg.id
    network       = data.vsphere_network.de-lan.id
    datacenter    = data.vsphere_datacenter.de-freiburg.id
  }

  spec = {
    cpu       = 2
    memory    = 2048
    disk_size = 15
  }
}

module "gravity-defr" {
  source = "../modules/vsphere_vm"
  name   = "gravity-defr1.prod.beryju.org"
  vsphere = {
    resource_pool = data.vsphere_resource_pool.de-general.id
    datastore     = data.vsphere_datastore_cluster.ssd-freiburg.id
    network       = data.vsphere_network.de-lan.id
    datacenter    = data.vsphere_datacenter.de-freiburg.id
  }

  spec = {
    cpu       = 1
    memory    = 1024
    disk_size = 10
  }
}
