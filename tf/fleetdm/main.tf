terraform {
  required_providers {
    fleetdm = {
      source  = "l-teles/fleetdm"
      version = "0.12.0"
    }
  }
}

data "vault_generic_secret" "fleet_auth" {
  path = "kv/services/fleetdm/terraform"
}

provider "fleetdm" {
  server_address = "https://fleet.beryjuio-prod.k8s.beryju.io"
  api_key        = data.vault_generic_secret.fleet_auth.data["api_key"]
}

resource "fleetdm_fleet" "workstations" {
  name = "💻 Workstations"
}

resource "fleetdm_fleet" "workstations-dev" {
  name = "💻 Workstations (dev)"
}

resource "fleetdm_fleet" "mobile" {
  name = "📱🔐 Personal mobile devices"
}

resource "fleetdm_fleet" "servers" {
  name = "Servers"
}
