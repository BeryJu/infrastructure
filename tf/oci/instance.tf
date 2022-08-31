resource "oci_core_instance_configuration" "default-instance-config" {
  compartment_id = local.compartment_id
  display_name   = "default-aarch-instance-config"
  instance_details {
    instance_type = "compute"
    launch_details {
      shape          = "VM.Standard.A1.Flex"
      compartment_id = local.compartment_id
      shape_config {
        ocpus         = 1
        memory_in_gbs = 6
      }
      source_details {
        source_type = "image"
        image_id    = data.oci_core_images.ubuntu-aarch.images[0].id
      }
      metadata = {
        ssh_authorized_keys = data.http.ssh-authorized-keys.response_body
        user_data           = base64encode(templatefile("${path.module}/templates/user-data.yaml", {}))
      }
      create_vnic_details {
        subnet_id                 = oci_core_subnet.homelab.id
        assign_public_ip          = true
        assign_private_dns_record = true
        # nsg_ids                   = [oci_core_network_security_group.uptime-kuma.id]
      }
    }
  }
}

resource "oci_core_instance_pool" "default-aarch-pool" {
  compartment_id            = local.compartment_id
  instance_configuration_id = oci_core_instance_configuration.default-instance-config.id

  placement_configurations {
    availability_domain = "XOIo:EU-FRANKFURT-1-AD-1"
    primary_subnet_id   = oci_core_subnet.homelab.id
  }
  size = 4
}
