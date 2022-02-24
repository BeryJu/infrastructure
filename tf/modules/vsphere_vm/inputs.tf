terraform {
  experiments = [module_variable_optional_attrs]
}

variable "name" {
  type = string
}

variable "spec" {
  type = object({
    cpu       = number
    memory    = number
    disk_size = number
    additional_network = optional(list(object({
      network = string
    })))
  })
}

variable "vsphere" {
  type = object({
    resource_pool = string
    datastore     = string
    network       = string
  })
}
