resource "grafana_folder" "beryjuorg-k8s-flux" {
  title = "BeryJu.io Flux"
}

data "http" "k8s-flux-cluster-dashboard" {
  url = "https://raw.githubusercontent.com/fluxcd/flux2-monitoring-example/main/monitoring/configs/dashboards/cluster.json"
}

resource "grafana_dashboard" "k8s-flux-cluster" {
  folder      = grafana_folder.beryjuorg-k8s-flux.id
  config_json = replace(data.http.k8s-flux-cluster-dashboard.response_body, "$${DS_PROMETHEUS}", "Prometheus")
}

data "http" "k8s-flux-control-plane-dashboard" {
  url = "https://raw.githubusercontent.com/fluxcd/flux2-monitoring-example/main/monitoring/configs/dashboards/control-plane.json"
}

resource "grafana_dashboard" "k8s-flux-control-plane" {
  folder      = grafana_folder.beryjuorg-k8s-flux.id
  config_json = replace(data.http.k8s-flux-control-plane-dashboard.response_body, "$${DS_PROMETHEUS}", "Prometheus")
}

data "http" "k8s-flux-logs-dashboard" {
  url = "https://raw.githubusercontent.com/fluxcd/flux2-monitoring-example/main/monitoring/configs/dashboards/logs.json"
}

resource "grafana_dashboard" "k8s-flux-logs" {
  folder      = grafana_folder.beryjuorg-k8s-flux.id
  config_json = replace(data.http.k8s-flux-logs-dashboard.response_body, "$${DS_PROMETHEUS}", "Prometheus")
}
