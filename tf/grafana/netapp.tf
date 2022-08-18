resource "grafana_folder" "beryjuorg-netapp" {
  title = "BeryJu.org NetApp"
}

data "http" "netapp-harvest_dashboard_aggregate" {
  url = "https://raw.githubusercontent.com/NetApp/harvest/main/grafana/dashboards/cmode/harvest_dashboard_aggregate.json"
}

resource "grafana_dashboard" "netapp-harvest_dashboard_aggregate" {
  folder      = grafana_folder.beryjuorg-netapp.id
  config_json = replace(data.http.netapp-harvest_dashboard_aggregate.response_body, "$${DS_PROMETHEUS}", "Prometheus")
}

data "http" "netapp-harvest_dashboard_cluster" {
  url = "https://raw.githubusercontent.com/NetApp/harvest/main/grafana/dashboards/cmode/harvest_dashboard_cluster.json"
}

resource "grafana_dashboard" "netapp-harvest_dashboard_cluster" {
  folder      = grafana_folder.beryjuorg-netapp.id
  config_json = replace(data.http.netapp-harvest_dashboard_cluster.response_body, "$${DS_PROMETHEUS}", "Prometheus")
}

data "http" "netapp-harvest_dashboard_disk" {
  url = "https://raw.githubusercontent.com/NetApp/harvest/main/grafana/dashboards/cmode/harvest_dashboard_disk.json"
}

resource "grafana_dashboard" "netapp-harvest_dashboard_disk" {
  folder      = grafana_folder.beryjuorg-netapp.id
  config_json = replace(data.http.netapp-harvest_dashboard_disk.response_body, "$${DS_PROMETHEUS}", "Prometheus")
}

data "http" "netapp-harvest_dashboard_lun" {
  url = "https://raw.githubusercontent.com/NetApp/harvest/main/grafana/dashboards/cmode/harvest_dashboard_lun.json"
}

resource "grafana_dashboard" "netapp-harvest_dashboard_lun" {
  folder      = grafana_folder.beryjuorg-netapp.id
  config_json = replace(data.http.netapp-harvest_dashboard_lun.response_body, "$${DS_PROMETHEUS}", "Prometheus")
}

data "http" "netapp-harvest_dashboard_metadata" {
  url = "https://raw.githubusercontent.com/NetApp/harvest/main/grafana/dashboards/cmode/harvest_dashboard_metadata.json"
}

resource "grafana_dashboard" "netapp-harvest_dashboard_metadata" {
  folder      = grafana_folder.beryjuorg-netapp.id
  config_json = replace(data.http.netapp-harvest_dashboard_metadata.response_body, "$${DS_PROMETHEUS}", "Prometheus")
}

data "http" "netapp-harvest_dashboard_network_detail" {
  url = "https://raw.githubusercontent.com/NetApp/harvest/main/grafana/dashboards/cmode/harvest_dashboard_network_detail.json"
}

resource "grafana_dashboard" "netapp-harvest_dashboard_network_detail" {
  folder      = grafana_folder.beryjuorg-netapp.id
  config_json = replace(data.http.netapp-harvest_dashboard_network_detail.response_body, "$${DS_PROMETHEUS}", "Prometheus")
}

data "http" "netapp-harvest_dashboard_node_details" {
  url = "https://raw.githubusercontent.com/NetApp/harvest/main/grafana/dashboards/cmode/harvest_dashboard_node_details.json"
}

resource "grafana_dashboard" "netapp-harvest_dashboard_node_details" {
  folder      = grafana_folder.beryjuorg-netapp.id
  config_json = replace(data.http.netapp-harvest_dashboard_node_details.response_body, "$${DS_PROMETHEUS}", "Prometheus")
}

data "http" "netapp-harvest_dashboard_shelf" {
  url = "https://raw.githubusercontent.com/NetApp/harvest/main/grafana/dashboards/cmode/harvest_dashboard_shelf.json"
}

resource "grafana_dashboard" "netapp-harvest_dashboard_shelf" {
  folder      = grafana_folder.beryjuorg-netapp.id
  config_json = replace(data.http.netapp-harvest_dashboard_shelf.response_body, "$${DS_PROMETHEUS}", "Prometheus")
}

data "http" "netapp-harvest_dashboard_snapmirror" {
  url = "https://raw.githubusercontent.com/NetApp/harvest/main/grafana/dashboards/cmode/harvest_dashboard_snapmirror.json"
}

resource "grafana_dashboard" "netapp-harvest_dashboard_snapmirror" {
  folder      = grafana_folder.beryjuorg-netapp.id
  config_json = replace(data.http.netapp-harvest_dashboard_snapmirror.response_body, "$${DS_PROMETHEUS}", "Prometheus")
}

data "http" "netapp-harvest_dashboard_svm_details" {
  url = "https://raw.githubusercontent.com/NetApp/harvest/main/grafana/dashboards/cmode/harvest_dashboard_svm_details.json"
}

resource "grafana_dashboard" "netapp-harvest_dashboard_svm_details" {
  folder      = grafana_folder.beryjuorg-netapp.id
  config_json = replace(data.http.netapp-harvest_dashboard_svm_details.response_body, "$${DS_PROMETHEUS}", "Prometheus")
}

data "http" "netapp-harvest_dashboard_volume_details" {
  url = "https://raw.githubusercontent.com/NetApp/harvest/main/grafana/dashboards/cmode/harvest_dashboard_volume_details.json"
}

resource "grafana_dashboard" "netapp-harvest_dashboard_volume_details" {
  folder      = grafana_folder.beryjuorg-netapp.id
  config_json = replace(data.http.netapp-harvest_dashboard_volume_details.response_body, "$${DS_PROMETHEUS}", "Prometheus")
}
