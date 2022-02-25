module "dev" {
  source = "../modules/vsphere_vm"
  name   = "dev1.lab.beryju.org"
  vsphere = {
    resource_pool = data.vsphere_resource_pool.uk-heavy.id
    datastore     = data.vsphere_datastore_cluster.ssd-london.id
    network       = data.vsphere_network.uk-vs-int-101-srv.id
  }

  spec = {
    cpu       = 4
    memory    = 6192
    disk_size = 50
  }
}

module "analytics" {
  source = "../modules/vsphere_vm"
  name   = "analytics1.prod.beryju.org"
  vsphere = {
    resource_pool = data.vsphere_resource_pool.uk-heavy.id
    datastore     = data.vsphere_datastore_cluster.ssd-london.id
    network       = data.vsphere_network.uk-vs-int-101-srv.id
  }

  spec = {
    cpu       = 2
    memory    = 2048
    disk_size = 10
  }
}

module "mc" {
  source = "../modules/vsphere_vm"
  name   = "mc1.prod.beryju.org"
  vsphere = {
    resource_pool = data.vsphere_resource_pool.uk-heavy.id
    datastore     = data.vsphere_datastore_cluster.ssd-london.id
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

module "ak-dev-dc" {
  source = "../modules/vsphere_vm"
  name   = "ak-dev-dc1.lab.beryju.org"
  vsphere = {
    resource_pool = data.vsphere_resource_pool.uk-heavy.id
    datastore     = data.vsphere_datastore_cluster.ssd-london.id
    network       = data.vsphere_network.uk-vs-int-101-srv.id
  }

  spec = {
    cpu       = 2
    memory    = 4096
    disk_size = 20
  }
}

module "ak-dev-k3s" {
  source = "../modules/vsphere_vm"
  name   = "ak-dev-k3s1.lab.beryju.org"
  vsphere = {
    resource_pool = data.vsphere_resource_pool.uk-heavy.id
    datastore     = data.vsphere_datastore_cluster.ssd-london.id
    network       = data.vsphere_network.uk-vs-int-101-srv.id
  }

  spec = {
    cpu       = 2
    memory    = 6144
    disk_size = 20
  }
}
