data "template_file" "vm-meta-data" {
  template = file("${path.module}/templates/meta-data.yaml")
  vars = {
    hostname = var.name
  }
}
data "template_file" "vm-user-data" {
  template = file("${path.module}/templates/user-data.yaml")
  vars = {
    hostname = var.name
  }
}
