resource "grafana_folder" "beryjuorg-istio" {
  title = "BeryJu.io Istio"
}

data "http" "istio-extension-dashboard" {
  url = "https://raw.githubusercontent.com/istio/istio/master/manifests/addons/dashboards/istio-extension-dashboard.json"
}

resource "grafana_dashboard" "istio-extension-dashboard" {
  folder      = grafana_folder.beryjuorg-istio.id
  config_json = data.http.istio-extension-dashboard.response_body
}

data "http" "istio-mesh-dashboard" {
  url = "https://raw.githubusercontent.com/istio/istio/master/manifests/addons/dashboards/istio-mesh-dashboard.gen.json"
}

resource "grafana_dashboard" "istio-mesh-dashboard" {
  folder      = grafana_folder.beryjuorg-istio.id
  config_json = data.http.istio-mesh-dashboard.response_body
}

data "http" "istio-performance-dashboard" {
  url = "https://raw.githubusercontent.com/istio/istio/master/manifests/addons/dashboards/istio-performance-dashboard.json"
}

resource "grafana_dashboard" "istio-performance-dashboard" {
  folder      = grafana_folder.beryjuorg-istio.id
  config_json = data.http.istio-performance-dashboard.response_body
}

data "http" "istio-service-dashboard" {
  url = "https://raw.githubusercontent.com/istio/istio/master/manifests/addons/dashboards/istio-service-dashboard.json"
}

resource "grafana_dashboard" "istio-service-dashboard" {
  folder      = grafana_folder.beryjuorg-istio.id
  config_json = data.http.istio-service-dashboard.response_body
}

data "http" "istio-workload-dashboard" {
  url = "https://raw.githubusercontent.com/istio/istio/master/manifests/addons/dashboards/istio-workload-dashboard.json"
}

resource "grafana_dashboard" "istio-workload-dashboard" {
  folder      = grafana_folder.beryjuorg-istio.id
  config_json = data.http.istio-workload-dashboard.response_body
}

data "http" "pilot-dashboard" {
  url = "https://raw.githubusercontent.com/istio/istio/master/manifests/addons/dashboards/pilot-dashboard.gen.json"
}

resource "grafana_dashboard" "pilot-dashboard" {
  folder      = grafana_folder.beryjuorg-istio.id
  config_json = data.http.pilot-dashboard.response_body
}

data "http" "ztunnel-dashboard" {
  url = "https://raw.githubusercontent.com/istio/istio/master/manifests/addons/dashboards/ztunnel-dashboard.gen.json"
}

resource "grafana_dashboard" "ztunnel-dashboard" {
  folder      = grafana_folder.beryjuorg-istio.id
  config_json = data.http.ztunnel-dashboard.response_body
}
