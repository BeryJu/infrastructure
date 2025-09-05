variable "name" {
  type = string
}

variable "access_group" {
  type = list(string)
}

variable "property_mappings" {
  type = list(string)
}
