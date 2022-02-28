module "nas" {
  source = "../modules/vsphere_vm"
  name   = "nas1.prod.beryju.org"
  vsphere = {
    resource_pool = data.vsphere_resource_pool.de-general.id
    datastore     = data.vsphere_datastore_cluster.ssd-freiburg.id
    network       = data.vsphere_network.de-lan.id
  }

  spec = {
    cpu       = 2
    memory    = 8192
    disk_size = 10
  }
}
