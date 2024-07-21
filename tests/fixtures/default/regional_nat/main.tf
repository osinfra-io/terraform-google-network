# Required Providers
# https://developer.hashicorp.com/terraform/language/providers/requirements

terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}

module "all_subnets_test" {
  source = "../../../../regional/nat"

  network = "terraform-test-vpc"
  project = var.project
  region  = "us-east1"
}

module "list_of_subnets_test" {
  source = "../../../../regional/nat"

  network                            = "terraform-test-vpc"
  prefix                             = "terraform-test-vpc-subnetworks"
  project                            = var.project
  region                             = "us-east1"
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  subnetwork_names                   = ["fleet-member-us-east1"]
}
