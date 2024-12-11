resource "grafana_folder" "beryjuorg-k8s-preset" {
  title = "BeryJu.org Kube-prom-stack"
}

module "k8s-dashboards" {
  source         = "BeryJu/prom-stack-dashboards/kube"
  grafana_folder = grafana_folder.beryjuorg-k8s-preset.id
  version        = "2.5.0"
}
