resource "oci_core_instance" "kube" {
  display_name         = "oci-kube-1"
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
    boot_volume_size_in_gbs = 100
  }

  availability_config {
    recovery_action = "RESTORE_INSTANCE"
  }

  create_vnic_details {
    subnet_id                 = oci_core_subnet.homelab.id
    assign_public_ip          = true
    assign_private_dns_record = true
    nsg_ids = [
      "ocid1.networksecuritygroup.oc1.eu-frankfurt-1.aaaaaaaatpz4gc4ialfoin7qjxe5ywgzstx3vfoclweqn6cq5lnporh5epna",
    ]
  }

  metadata = {
    ssh_authorized_keys = data.http.ssh-authorized-keys.response_body
    user_data           = base64encode(templatefile("${path.module}/templates/user-data.yaml", {}))
  }
}

data "aws_route53_zone" "beryju-org" {
  name = "beryju.org"
}

resource "aws_route53_record" "kube-api-record" {
  zone_id = data.aws_route53_zone.beryju-org.zone_id
  name    = "kube-api.beryjuio-oci.k8s.beryju.org"
  type    = "A"
  ttl     = "3600"
  records = [
    oci_core_instance.kube.public_ip,
  ]
}

resource "aws_route53_record" "kube-lb" {
  zone_id = data.aws_route53_zone.beryju-org.zone_id
  name    = "*.beryjuio-oci.k8s.beryju.org"
  type    = "A"
  ttl     = "3600"
  records = [
    oci_core_instance.kube.public_ip,
  ]
}
