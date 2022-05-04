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

module "k8s-infra" {
  source = "../modules/vsphere_vm"
  name   = "k8s-infra1.prod.beryju.org"
  vsphere = {
    resource_pool = data.vsphere_resource_pool.de-general.id
    datastore     = data.vsphere_datastore_cluster.ssd-freiburg.id
    network       = data.vsphere_network.de-lan.id
    datacenter    = data.vsphere_datacenter.de-freiburg.id
  }

  spec = {
    cpu       = 1
    memory    = 2048
    disk_size = 16
  }
}
