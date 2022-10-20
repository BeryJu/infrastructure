resource "oci_core_instance" "k3s" {
  display_name         = "oci-k3s"
  availability_domain  = "XOIo:EU-FRANKFURT-1-AD-1"
  compartment_id       = local.compartment_id
  shape                = "VM.Standard.A1.Flex"
  state                = "RUNNING"
  preserve_boot_volume = true

  shape_config {
    ocpus         = 4
    memory_in_gbs = 24
  }

  source_details {
    source_type             = "image"
    source_id               = data.oci_core_images.ubuntu-aarch.images[0].id
    boot_volume_size_in_gbs = 50 # Minimum
  }

  availability_config {
    recovery_action = "RESTORE_INSTANCE"
  }

  create_vnic_details {
    subnet_id                 = oci_core_subnet.homelab.id
    assign_public_ip          = true
    assign_private_dns_record = true
  }

  metadata = {
    ssh_authorized_keys = data.http.ssh-authorized-keys.response_body
    user_data           = base64encode(templatefile("${path.module}/templates/user-data.yaml", {}))
  }
}
