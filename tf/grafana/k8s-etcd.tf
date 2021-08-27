data "http" "k8s-etcd-dashboard" {
  url = "https://raw.githubusercontent.com/etcd-io/website/master/content/en/docs/v3.4/op-guide/grafana.json"
}

resource "grafana_dashboard" "k8s-etcd" {
  folder      = grafana_folder.beryjuorg-k8s-preset.id
  config_json = data.http.k8s-etcd-dashboard.body
}
