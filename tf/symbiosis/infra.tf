module "k8s-infra" {
  source = "../modules/k8s_cluster"

  name = "beryjuio-infra"
}

resource "symbiosis_node_pool" "infra-default" {
  cluster   = "beryjuio-infra"
  name      = "default"
  node_type = "general-2"
  quantity  = 2
}
