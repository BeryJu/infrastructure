data "vsphere_virtual_machine" "template" {
  name          = var.template
  datacenter_id = var.vsphere.datacenter
}

locals {
  fqdn_parts = split(".", var.name)
  domain_parts = slice(local.fqdn_parts, 1, length(local.fqdn_parts))
  domain = join(".", local.domain_parts)
}

resource "vsphere_virtual_machine" "vm" {
  name                 = var.name
  resource_pool_id     = var.vsphere.resource_pool
  datastore_cluster_id = var.vsphere.datastore

  num_cpus = var.spec.cpu
  memory   = var.spec.memory
  guest_id = "ubuntu64Guest"

  sync_time_with_host = true

  network_interface {
    network_id   = var.vsphere.network
    adapter_type = "vmxnet3"
  }

  dynamic "network_interface" {
    for_each = var.spec.additional_network != null ? var.spec.additional_network : []
    content {
      network_id   = network_interface.value.network
      adapter_type = "vmxnet3"
    }
  }

  extra_config = {
    "guestinfo.userdata" = base64encode(templatefile("${path.module}/templates/user-data.yaml", {
      hostname = var.name,
      domain = local.domain,
    }))
    "guestinfo.userdata.encoding" = "base64"
    "guestinfo.metadata" = base64encode(templatefile("${path.module}/templates/meta-data.yaml", {
      hostname = var.name
    }))
    "guestinfo.metadata.encoding" = "base64"
  }

  disk {
    label = "disk0"
    size  = var.spec.disk_size
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
  }

  lifecycle {
    ignore_changes = [
      folder,
      disk.0.thin_provisioned,
      clone.0.template_uuid,
      resource_pool_id,
      pci_device_id,
      memory_reservation,
      # until https://github.com/hashicorp/terraform-provider-vsphere/pull/1603
      extra_config,
    ]
  }
}
