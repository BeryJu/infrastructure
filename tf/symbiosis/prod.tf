module "k8s-prod" {
  source = "../modules/k8s_cluster"

  name = "beryjuio-prod"
}

resource "symbiosis_node_pool" "prod-default" {
  cluster   = "beryjuio-prod"
  name      = "tf-general-2"
  node_type = "general-2"
  quantity  = 2
}

resource "symbiosis_node_pool" "prod-general-3-autoscale" {
  cluster   = "beryjuio-prod"
  name      = "tf-general-3"
  node_type = "general-3"
  quantity  = 3
}
