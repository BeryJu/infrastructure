module "k8s-defr-control-plane" {
  source = "../modules/vsphere_vm"
  name   = "k8s-defr-cp1.prod.beryju.org"
  vsphere = {
    resource_pool = data.vsphere_resource_pool.de-general.id
    datastore     = data.vsphere_datastore_cluster.ssd-freiburg.id
    network       = data.vsphere_network.de-lan.id
    datacenter    = data.vsphere_datacenter.de-freiburg.id
  }

  spec = {
    cpu       = 2
    memory    = 4096
    disk_size = 25
  }
}
