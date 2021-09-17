resource "grafana_folder" "beryjuorg-citrix-adc" {
  title = "BeryJu.org Citrix ADC"
}

data "http" "citrix-adc-system-status" {
  url = "https://raw.githubusercontent.com/citrix/citrix-adc-metrics-exporter/master/sample_system_stats.json"
}

resource "grafana_dashboard" "citrix-adc-system-status" {
  folder      = grafana_folder.beryjuorg-citrix-adc.id
  config_json = data.http.citrix-adc-system-status.body
}

data "http" "citrix-adc-lb-status" {
  url = "https://raw.githubusercontent.com/citrix/citrix-adc-metrics-exporter/master/sample_lb_stats.json"
}

resource "grafana_dashboard" "citrix-adc-lb-status" {
  folder      = grafana_folder.beryjuorg-citrix-adc.id
  config_json = data.http.citrix-adc-lb-status.body
}
