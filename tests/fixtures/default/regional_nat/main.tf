module "test" {
  source = "../../../../regional/nat"

  # Cloud NAT (network address translation) lets certain resources without external IP addresses create outbound connections to the internet.
  # https://cloud.google.com/nat/docs/overview

  network = "terraform-test-vpc"
  project = var.project
  region  = "us-east1"
}

module "test1" {
  source = "../../../../regional/nat"

  # Cloud NAT (network address translation) lets certain resources without external IP addresses create outbound connections to the internet.
  # https://cloud.google.com/nat/docs/overview

  network                            = "terraform-test-vpc"
  prefix                             = "terraform-test-vpc-subnetworks"
  project                            = var.project
  region                             = "us-east1"
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  subnetwork_names                   = ["fleet-member-us-east1"]
}
