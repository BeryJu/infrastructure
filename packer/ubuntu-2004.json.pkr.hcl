# Connection settings
variable "vcenter_address" {
  type    = string
  default = "vc1.prod.beryju.org"
}

variable "vcenter_password" {
  type      = string
  default   = vault("/kv/data/vsphere/local/administrator", "password")
  sensitive = true
}

variable "vcenter_user" {
  type    = string
  default = vault("/kv/data/vsphere/local/administrator", "username")
}

variable "vcenter_ignore_ssl" {
  type    = string
  default = "true"
}

# Location settings

variable "vcenter_dc" {
  type    = string
  default = "uk-coventry"
}

variable "vcenter_datastore" {
  type    = string
  default = "ssd-b"
}

variable "vcenter_network" {
  type    = string
  default = "vs-int-101-srv"
}

variable "vm_name" {
  type    = string
  default = "ubuntu2004-beryjuorg-base-test"
}

# source blocks are generated from your builders; a source can be referenced in
# build blocks. A build block runs provisioner and post-processors on a
# source. Read the documentation for source blocks here:
# https://www.packer.io/docs/from-1.5/blocks/source
source "vsphere-iso" "vm" {
  vcenter_server      = "${var.vcenter_address}"
  username            = "${var.vcenter_user}"
  password            = "${var.vcenter_password}"
  insecure_connection = "${var.vcenter_ignore_ssl}"

  datacenter = "${var.vcenter_dc}"
  cluster    = "prod"
  datastore  = "${var.vcenter_datastore}"
  vm_name    = "${var.vm_name}"

  CPUs                 = 2
  RAM                  = 2048
  disk_controller_type = ["pvscsi"]
  guest_os_type        = "ubuntu64Guest"
  network_adapters {
    network      = "${var.vcenter_network}"
    network_card = "vmxnet3"
  }
  iso_paths           = ["[${vcenter_datastore}] ISO/ubuntu-20.04-live-server-amd64.iso"]
  convert_to_template = true
  storage {
    disk_size             = 8192
    disk_thin_provisioned = true
  }

  http_directory = "cloud-init"
  http_port_min  = 8000
  http_port_max  = 8000
  boot_command = [
    "<esc><esc><esc>",
    "<enter><wait>",
    "/casper/vmlinuz ",
    "root=/dev/sr0 ",
    "initrd=/casper/initrd ",
    "autoinstall ",
    "ds=nocloud-net;s=http://wks.jela.io:8000/",
    "<enter>"
  ]
  boot_wait = "2s"

  ip_wait_timeout  = "3600s"
  shutdown_command = "echo 'vagrant' |sudo -S shutdown -P now"
  ssh_password     = "vagrant"
  ssh_port         = 22
  ssh_timeout      = "15m"
  ssh_username     = "vagrant"
}

build {
  sources = ["source.vsphere-iso.vm"]

  provisioner "shell" {
    execute_command = "echo 'vagrant' | {{.Vars}} sudo -S -E bash '{{.Path}}'"
    script          = "scripts/setup_ubuntu2004.sh"
  }
}
