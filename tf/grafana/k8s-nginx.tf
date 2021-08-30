resource "grafana_folder" "beryjuorg-k8s-nginx" {
  title = "BeryJu.org Nginx"
}

data "http" "k8s-ingress-nginx-dashboard" {
  url = "https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/grafana/dashboards/nginx.json"
}

resource "grafana_dashboard" "k8s-nginx" {
  folder      = grafana_folder.beryjuorg-k8s-nginx.id
  config_json = data.http.k8s-ingress-nginx-dashboard.body
}
