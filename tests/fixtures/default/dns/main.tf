terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}

module "public_test" {
  source = "../../../../dns"

  dns_name   = "mock-subdomain.mock-domain.io."
  labels     = local.labels
  name       = "mock-subdomain-mock-domain"
  project    = var.project
  visibility = "public"
}

module "private_test" {
  source = "../../../../dns"

  dns_name                           = "mock-priv-subdomain.mock-domain."
  labels                             = local.labels
  name                               = "mock-priv-subdomain-mock-domain"
  private_visibility_config_networks = ["https://www.googleapis.com/compute/v1/projects/${var.project}/global/networks/mock-vpc"]
  project                            = var.project
  visibility                         = "private"
}
