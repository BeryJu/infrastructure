variable "fqdn" {
  type = string
}

variable "address" {
  type = string
}

variable "from_vm" {
  type    = bool
  default = false
}

variable "additional_hosts" {
  type = list(object({
    fqdn    = string
    address = string
  }))
  default = []
}
