data "oci_core_images" "ubuntu-aarch" {
  compartment_id = local.compartment_id

  operating_system         = "Canonical Ubuntu"
  operating_system_version = "22.04 Minimal aarch64"
}

data "http" "ssh-authorized-keys" {
  url = "https://github.com/beryju.keys"
}
