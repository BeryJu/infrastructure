variable "name" {
  type = string
}

variable "template" {
  type    = string
  default = "ubuntu2004-cloudimg-base"
}

variable "spec" {
  type = object({
    cpu       = number
    memory    = number
    disk_size = number
    additional_network = optional(list(object({
      network = string
    })))
    additional_disks = optional(list(object({
      size = number
    })))
  })
}

variable "vsphere" {
  type = object({
    resource_pool = string
    datastore     = string
    network       = string
    datacenter    = string
  })
}
