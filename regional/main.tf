# Compute Subnetwork Resource
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork

resource "google_compute_subnetwork" "this" {

  # Ensure that Private google access is enabled for IPV6
  # checkov:skip=CKV_GCP_76: We are not using IPV6

  ip_cidr_range            = var.ip_cidr_range
  name                     = var.name
  network                  = var.network
  private_ip_google_access = var.private_ip_google_access
  project                  = var.project
  purpose                  = var.purpose
  region                   = var.region
  role                     = var.role

  dynamic "secondary_ip_range" {
    for_each = var.secondary_ip_ranges

    content {
      range_name    = secondary_ip_range.value.range_name
      ip_cidr_range = secondary_ip_range.value.ip_cidr_range
    }
  }

  dynamic "log_config" {
    for_each = var.purpose != "INTERNAL_HTTPS_LOAD_BALANCER" ? [0] : []
    content {
      flow_sampling        = 1
      metadata             = "INCLUDE_ALL_METADATA"
      aggregation_interval = "INTERVAL_5_SEC"
    }
  }
}
