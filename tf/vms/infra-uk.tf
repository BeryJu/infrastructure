module "rancher" {
  source = "../modules/vsphere_vm"
  name   = "rancher1.prod.beryju.org"
  vsphere = {
    resource_pool = data.vsphere_resource_pool.uk-heavy.id
    datastore     = data.vsphere_datastore_cluster.ssd-london.id
    network       = data.vsphere_network.uk-vs-int-101-srv.id
    datacenter    = data.vsphere_datacenter.uk-london.id
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

module "gitlab" {
  source = "../modules/vsphere_vm"
  name   = "gitlab1.prod.beryju.org"
  vsphere = {
    resource_pool = data.vsphere_resource_pool.uk-heavy.id
    datastore     = data.vsphere_datastore_cluster.ssd-london.id
    network       = data.vsphere_network.uk-vs-int-101-srv.id
    datacenter    = data.vsphere_datacenter.uk-london.id
  }

  spec = {
    cpu       = 3
    memory    = 8192
    disk_size = 50
    additional_network = [
      {
        network = data.vsphere_network.uk-vs-int-100-dmz.id
      }
    ]
  }
}

module "mon" {
  source = "../modules/vsphere_vm"
  name   = "mon1.prod.beryju.org"
  vsphere = {
    resource_pool = data.vsphere_resource_pool.uk-heavy.id
    datastore     = data.vsphere_datastore_cluster.ssd-london.id
    network       = data.vsphere_network.uk-vs-int-101-srv.id
    datacenter    = data.vsphere_datacenter.uk-london.id
  }

  spec = {
    cpu       = 3
    memory    = 32768
    disk_size = 250
  }
}

module "netbox" {
  source = "../modules/vsphere_vm"
  name   = "netbox1.prod.beryju.org"
  vsphere = {
    resource_pool = data.vsphere_resource_pool.uk-heavy.id
    datastore     = data.vsphere_datastore_cluster.ssd-london.id
    network       = data.vsphere_network.uk-vs-int-101-srv.id
    datacenter    = data.vsphere_datacenter.uk-london.id
  }

  spec = {
    cpu       = 2
    memory    = 2048
    disk_size = 8
  }
}

module "puppet" {
  source = "../modules/vsphere_vm"
  name   = "puppet1.prod.beryju.org"
  vsphere = {
    resource_pool = data.vsphere_resource_pool.uk-heavy.id
    datastore     = data.vsphere_datastore_cluster.ssd-london.id
    network       = data.vsphere_network.uk-vs-int-101-srv.id
    datacenter    = data.vsphere_datacenter.uk-london.id
  }

  spec = {
    cpu       = 2
    memory    = 4096
    disk_size = 10
    additional_network = [
      {
        network = data.vsphere_network.uk-vs-int-100-dmz.id
      }
    ]
  }
}

module "vault" {
  source = "../modules/vsphere_vm"
  name   = "vault1.prod.beryju.org"
  vsphere = {
    resource_pool = data.vsphere_resource_pool.uk-heavy.id
    datastore     = data.vsphere_datastore_cluster.ssd-london.id
    network       = data.vsphere_network.uk-vs-int-101-srv.id
    datacenter    = data.vsphere_datacenter.uk-london.id
  }

  spec = {
    cpu       = 2
    memory    = 2048
    disk_size = 8
  }
}
