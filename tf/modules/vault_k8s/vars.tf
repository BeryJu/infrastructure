variable "path" {
  type = string
}

variable "host" {
  type = string
}

variable "ca" {
  type = string
}

variable "jwt" {
  type      = string
  default   = ""
  sensitive = true
}
