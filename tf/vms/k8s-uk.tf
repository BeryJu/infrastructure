module "k8s-prd-c" {
  source = "../modules/vsphere_vm"
  name   = "k8s-prd-c1.prod.beryju.org"
  vsphere = {
    resource_pool = data.vsphere_resource_pool.uk-heavy.id
    datastore     = data.vsphere_datastore.ssd-london-b.id
    network       = data.vsphere_network.uk-vs-int-101-srv.id
  }

  spec = {
    cpu       = 2
    memory    = 8192
    disk_size = 25
  }
}

module "k8s-prd-w" {
  count  = 4
  source = "../modules/vsphere_vm"
  name   = "k8s-prd-w${count.index + 1}.prod.beryju.org"
  vsphere = {
    resource_pool = data.vsphere_resource_pool.uk-heavy.id
    datastore     = data.vsphere_datastore.ssd-london-b.id
    network       = data.vsphere_network.uk-vs-int-101-srv.id
  }

  spec = {
    cpu       = count.index < 3 ? 4 : 2
    memory    = 8192
    disk_size = 25
  }
}
