module "k8s-dashboards" {
  source = "github.com/BeryJu/kube-prom-stack-dashboards"
  grafana_folder = grafana_folder.beryjuorg-k8s-preset.id
}
