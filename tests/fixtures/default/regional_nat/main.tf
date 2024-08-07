terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}

module "all_subnets_test" {
  source = "../../../../regional/nat"

  network = "mock-vpc"
  project = var.project
  region  = "mock-region"
}

module "list_of_subnets_test" {
  source = "../../../../regional/nat"

  network                            = "mock-vpc"
  prefix                             = "mock-vpc-subnetworks"
  project                            = var.project
  region                             = "mock-region"
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  subnetwork_names                   = ["mock-subnetwork"]
}
