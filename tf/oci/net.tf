resource "oci_core_vcn" "orc" {
  compartment_id = local.compartment_id
  display_name   = "ORC-beryjuio"
  dns_label      = "beryjuio"
  cidr_blocks = [
    "10.120.90.0/24"
  ]
}

resource "oci_core_internet_gateway" "orc_ig" {
  compartment_id = local.compartment_id
  vcn_id         = oci_core_vcn.orc.id
  display_name   = "ORC-IG"
  enabled        = true
}

resource "oci_core_route_table" "orc_routes" {
  compartment_id = local.compartment_id
  vcn_id         = oci_core_vcn.orc.id
  display_name   = "ORC-RouteTable"
  route_rules {
    network_entity_id = oci_core_internet_gateway.orc_ig.id
    description       = "Default route"
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
  }
}

resource "oci_core_subnet" "homelab" {
  cidr_block     = "10.120.90.0/24"
  compartment_id = local.compartment_id
  vcn_id         = oci_core_vcn.orc.id
  display_name   = "default"
  route_table_id = oci_core_route_table.orc_routes.id
}

resource "oci_core_security_list" "orc_sl" {
  compartment_id = local.compartment_id
  vcn_id         = oci_core_vcn.orc.id
  display_name   = "Default security list"
  egress_security_rules {
    description      = ""
    protocol         = "all"
    destination      = "0.0.0.0/0"
    destination_type = "CIDR_BLOCK"
    stateless        = false
  }
  ingress_security_rules {
    description = ""
    protocol    = "all"
    source      = "0.0.0.0/0"
    source_type = "CIDR_BLOCK"
    stateless   = true
  }
  ingress_security_rules {
    description = ""
    protocol    = 1
    source      = "0.0.0.0/0"
    source_type = "CIDR_BLOCK"
    stateless   = false
    icmp_options {
      type = "3"
      code = "4"
    }
  }
  ingress_security_rules {
    description = ""
    protocol    = 1
    source      = "10.120.0.0/16"
    source_type = "CIDR_BLOCK"
    stateless   = false
    icmp_options {
      type = "3"
    }
  }
}
