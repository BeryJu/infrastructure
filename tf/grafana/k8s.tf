resource "grafana_folder" "beryjuorg-k8s-preset" {
  title = "BeryJu.org Kube-prom-stack"
}

module "k8s-dashboards" {
  source         = "github.com/BeryJu/terraform-kube-prom-stack-dashboards"
  grafana_folder = grafana_folder.beryjuorg-k8s-preset.id
}
