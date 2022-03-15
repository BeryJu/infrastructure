terraform {
  experiments = [module_variable_optional_attrs]
}

variable "name" {
  type = string
}

variable "internal" {
  type = string
}

variable "external" {
  type = string
}

variable "access_group" {
  type = list(string)
}

output "app_id" {
  value = authentik_application.app.id
}

output "provider_ia" {
  value = authentik_provider_proxy.provider.id
}
