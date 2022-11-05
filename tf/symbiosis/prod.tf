module "k8s-prod" {
  source = "../modules/k8s_cluster"

  name = "beryjuio-prod"
}

resource "symbiosis_node_pool" "prod-default" {
  cluster   = "beryjuio-prod"
  name      = "default"
  node_type = "general-2"
  quantity  = 2
}
