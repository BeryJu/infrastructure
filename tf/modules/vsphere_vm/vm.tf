resource "vsphere_virtual_machine" "vm" {
  name             = var.name
  resource_pool_id = var.vsphere.resource_pool
  datastore_id     = var.vsphere.datastore

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
    "guestinfo.userdata"          = base64encode(data.template_file.vm-user-data.rendered)
    "guestinfo.userdata.encoding" = "base64"
    "guestinfo.metadata"          = base64encode(data.template_file.vm-meta-data.rendered)
    "guestinfo.metadata.encoding" = "base64"
  }

  disk {
    label = "disk0"
    size  = var.spec.disk_size
  }

  lifecycle {
    ignore_changes = [
      folder,
      disk.0.thin_provisioned,
      resource_pool_id,
    ]
  }
}
