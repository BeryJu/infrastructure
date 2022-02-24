module "rancher1" {
  source = "../modules/vsphere_vm"
  name   = "rancher1.prod.beryju.org"
  vsphere = {
    resource_pool = data.vsphere_resource_pool.uk-heavy.id
    datastore     = data.vsphere_datastore.ssd-london-b.id
    network       = data.vsphere_network.uk-vs-int-101-srv.id
  }

  spec = {
    cpu       = 2
    memory    = 4096
    disk_size = 25
    additional_network = [
      {
        network = data.vsphere_network.uk-vs-int-100-dmz.id
      }
    ]
  }
}
