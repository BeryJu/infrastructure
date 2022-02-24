module "dev1" {
  source = "../modules/vsphere_vm"
  name   = "dev1.lab.beryju.org"
  vsphere = {
    resource_pool = data.vsphere_resource_pool.uk-heavy.id
    datastore     = data.vsphere_datastore.ssd-london-b.id
    network       = data.vsphere_network.uk-vs-int-101-srv.id
  }

  spec = {
    cpu       = 4
    memory    = 6192
    disk_size = 50
  }
}

module "analytics1" {
  source = "../modules/vsphere_vm"
  name   = "analytics1.prod.beryju.org"
  vsphere = {
    resource_pool = data.vsphere_resource_pool.uk-heavy.id
    datastore     = data.vsphere_datastore.ssd-london-b.id
    network       = data.vsphere_network.uk-vs-int-101-srv.id
  }

  spec = {
    cpu       = 2
    memory    = 2048
    disk_size = 10
  }
}

module "mc1" {
  source = "../modules/vsphere_vm"
  name   = "mc1.prod.beryju.org"
  vsphere = {
    resource_pool = data.vsphere_resource_pool.uk-heavy.id
    datastore     = data.vsphere_datastore.ssd-london-b.id
    network       = data.vsphere_network.uk-vs-int-101-srv.id
  }

  spec = {
    cpu       = 4
    memory    = 8192
    disk_size = 15
    additional_network = [
      {
        network = data.vsphere_network.uk-vs-int-100-dmz.id
      }
    ]
  }
}
