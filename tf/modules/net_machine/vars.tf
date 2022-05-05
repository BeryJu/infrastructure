variable "fqdn" {
  type = string
}

variable "address" {
  type = string
}

# variable "mac" {
#   type = optional(string)
# }

variable "additional_hosts" {
  type = list(object({
    fqdn    = string
    address = string
  }))
  default = []
}
