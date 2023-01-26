resource "linode_lke_cluster" "prod" {
  label       = "beryjuio-prod"
  k8s_version = "1.25"
  region      = "eu-central"
  control_plane {
    high_availability = false
  }
  pool {
    type  = "g6-dedicated-2"
    count = 3
    autoscaler {
      max = 4
      min = 2
    }
  }
}
