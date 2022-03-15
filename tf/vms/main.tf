data "vault_generic_secret" "vsphere_auth" {
  path = "kv/vsphere/local/terraform"
}

provider "vsphere" {
  user                 = data.vault_generic_secret.vsphere_auth.data["username"]
  password             = data.vault_generic_secret.vsphere_auth.data["password"]
  vsphere_server       = "vc1.prod.beryju.org"
  allow_unverified_ssl = true
}

data "vsphere_datacenter" "uk-london" {
  name = "uk-london"
}

data "vsphere_datacenter" "de-freiburg" {
  name = "de-freiburg"
}

data "vsphere_datastore_cluster" "ssd-london" {
  name          = "ssd-london"
  datacenter_id = data.vsphere_datacenter.uk-london.id
}

data "vsphere_datastore_cluster" "ssd-freiburg" {
  name          = "ssd-freiburg"
  datacenter_id = data.vsphere_datacenter.de-freiburg.id
}

data "vsphere_resource_pool" "uk-heavy" {
  name          = "prod/Resources/heavy"
  datacenter_id = data.vsphere_datacenter.uk-london.id
}

data "vsphere_resource_pool" "de-general" {
  name          = "prod/Resources"
  datacenter_id = data.vsphere_datacenter.de-freiburg.id
}

data "vsphere_network" "uk-vs-int-100-dmz" {
  name          = "vs-int-100-dmz"
  datacenter_id = data.vsphere_datacenter.uk-london.id
}

data "vsphere_network" "uk-vs-int-101-srv" {
  name          = "vs-int-101-srv"
  datacenter_id = data.vsphere_datacenter.uk-london.id
}

data "vsphere_network" "uk-vs-int-999-testing" {
  name          = "vs-int-999-testing"
  datacenter_id = data.vsphere_datacenter.uk-london.id
}

data "vsphere_network" "de-lan" {
  name          = "ds-defr-lan"
  datacenter_id = data.vsphere_datacenter.de-freiburg.id
}
