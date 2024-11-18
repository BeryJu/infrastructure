resource "grafana_folder" "beryjuorg-k8s-kyverno" {
  title = "BeryJu.org Kyverno"
}

data "http" "k8s-kyverno-dashboard" {
  url = "https://raw.githubusercontent.com/kyverno/kyverno/main/charts/kyverno/charts/grafana/dashboard/kyverno-dashboard.json"
}

resource "grafana_dashboard" "k8s-kyverno" {
  folder      = grafana_folder.beryjuorg-k8s-kyverno.id
  config_json = replace(data.http.k8s-kyverno-dashboard.response_body, "$${DS_PROMETHEUS_KYVERNO}", "Prometheus")
}
