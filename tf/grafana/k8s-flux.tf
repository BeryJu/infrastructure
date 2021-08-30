resource "grafana_folder" "beryjuorg-k8s-flux" {
  title = "BeryJu.org Flux"
}

data "http" "k8s-flux-cluster-dashboard" {
  url = "https://raw.githubusercontent.com/fluxcd/flux2/main/manifests/monitoring/grafana/dashboards/cluster.json"
}

resource "grafana_dashboard" "k8s-flux-cluster" {
  folder      = grafana_folder.beryjuorg-k8s-flux.id
  config_json = data.http.k8s-flux-cluster-dashboard.body
}

data "http" "k8s-flux-control-plane-dashboard" {
  url = "https://raw.githubusercontent.com/fluxcd/flux2/main/manifests/monitoring/grafana/dashboards/control-plane.json"
}

resource "grafana_dashboard" "k8s-flux-control-plane" {
  folder      = grafana_folder.beryjuorg-k8s-flux.id
  config_json = data.http.k8s-flux-control-plane-dashboard.body
}
