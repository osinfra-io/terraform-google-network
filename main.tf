# Firewall Resource
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall

resource "google_compute_firewall" "rules" {
  for_each = merge({ for rule in var.rules : rule.name => rule }, { for rule in local.rules : rule.name => rule })

  description        = each.value.description
  destination_ranges = each.value.direction == "EGRESS" ? each.value.ranges : null
  direction          = each.value.direction
  name               = "${var.name}-${each.value.name}"
  network            = google_compute_network.this.name
  priority           = each.value.priority
  project            = var.project
  source_ranges      = each.value.direction == "INGRESS" ? each.value.ranges : null
  source_tags        = each.value.source_tags
  target_tags        = each.value.target_tags

  dynamic "allow" {
    for_each = each.value.allow
    content {
      protocol = allow.value["protocol"]
      ports    = allow.value["ports"]
    }
  }

  dynamic "deny" {
    for_each = each.value.deny
    content {
      protocol = deny.value["protocol"]
      ports    = deny.value["ports"]
    }
  }

  dynamic "log_config" {
    for_each = each.value.log_config_enabled ? [each.value.log_config_metadata] : []
    content {
      metadata = log_config.value
    }
  }
}

# Compute Network Resource
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network

resource "google_compute_network" "this" {
  auto_create_subnetworks = "false"
  name                    = var.name
  project                 = var.project
  routing_mode            = "GLOBAL"
}

# Compute Shared VPC Host Project Resource
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_shared_vpc_host_project

resource "google_compute_shared_vpc_host_project" "this" {
  count = var.shared_vpc ? 1 : 0

  project = var.project
}

# Compute Shared VPC Service Project Resource
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_shared_vpc_service_project

resource "google_compute_shared_vpc_service_project" "this" {
  for_each = var.shared_vpc ? { for i in var.shared_vpc_service_projects : i => true } : {}

  host_project    = google_compute_shared_vpc_host_project.this[0].id
  service_project = each.key
}
