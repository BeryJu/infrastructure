# Connection settings
variable "vcenter_address" {
  type    = string
  default = "vc1.prod.beryju.org"
}

locals {
  vcenter_user     = vault("/kv/data/vsphere/local/administrator", "username")
  vcenter_password = vault("/kv/data/vsphere/local/administrator", "password")
}

# Location settings
variable "vcenter_dc" {
  type    = string
  default = "uk-london"
}

variable "vcenter_datastore" {
  type    = string
  default = "ssd-a"
}

variable "vcenter_network" {
  type    = string
  default = "vs-int-101-srv"
}

variable "vm_name" {
  type    = string
  default = "ubuntu2004-beryjuorg-base"
}

source "vsphere-iso" "vm" {
  vcenter_server      = var.vcenter_address
  username            = local.vcenter_user
  password            = local.vcenter_password
  insecure_connection = false

  datacenter = var.vcenter_dc
  cluster    = "prod"
  datastore  = var.vcenter_datastore
  vm_name    = var.vm_name

  CPUs                 = 2
  RAM                  = 2048
  disk_controller_type = ["pvscsi"]
  guest_os_type        = "ubuntu64Guest"
  network_adapters {
    network      = var.vcenter_network
    network_card = "vmxnet3"
  }
  iso_url             = "https://releases.ubuntu.com/20.04.2/ubuntu-20.04.2-live-server-amd64.iso"
  iso_checksum        = "file:https://releases.ubuntu.com/20.04.2/SHA256SUMS"
  convert_to_template = true
  storage {
    disk_size             = 10240
    disk_thin_provisioned = true
  }

  cd_files = [
    "./cloud-init/meta-data",
    "./cloud-init/user-data"
  ]
  cd_label = "cidata"

  boot_command = [
    "<esc><esc><esc>",
    "<enter><wait>",
    "/casper/vmlinuz ",
    "root=/dev/sr0 ",
    "initrd=/casper/initrd ",
    "autoinstall",
    "<enter>"
  ]
  boot_wait = "5s"

  ip_wait_timeout  = "3600s"
  shutdown_command = "echo 'vagrant' | sudo -S shutdown -P now"
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
