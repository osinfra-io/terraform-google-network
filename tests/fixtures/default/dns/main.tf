# Required Providers
# https://developer.hashicorp.com/terraform/language/providers/requirements

terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}

module "public_test" {
  source = "../../../../dns"

  dns_name = "gcp.osinfra.io."

  labels = {
    cost-center = "x000"
    env         = "sb"
    repository  = "terraform-google-cloud-dns"
    team        = "testing"
  }

  name       = "gcp-osinfra-io"
  project    = var.project
  visibility = "public"
}

module "private_test" {
  source = "../../../../dns"

  dns_name = "gcp-priv.osinfra.io."

  labels = {
    cost-center = "x000"
    env         = "sb"
    repository  = "terraform-google-cloud-dns"
    team        = "testing"
  }

  name                               = "gcp-priv-osinfra-io"
  private_visibility_config_networks = ["https://www.googleapis.com/compute/v1/projects/${var.project}/global/networks/terraform-test-vpc"]
  project                            = var.project
  visibility                         = "private"
}
