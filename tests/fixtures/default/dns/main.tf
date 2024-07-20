module "private_test" {

  # This module will be consumed using the source address of the github repo and not the "../../../global" used in this test.
  # source = "github.com/osinfra-io/terraform-google-cloud-dns//global?ref=v0.0.0"

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

module "public_test" {

  # This module will be consumed using the source address of the github repo and not the "../../../global" used in this test.
  # source = "github.com/osinfra-io/terraform-google-cloud-dns//global?ref=v0.0.0"

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
