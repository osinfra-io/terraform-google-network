mock_provider "google" {}

run "default" {
  command = apply

    module {
    source = "./tests/fixtures/default"
  }

  assert {
    condition     = module.test.name == "test-vpc"
    error_message = "The VPC name does not match the expected value 'test-vpc'."
  }

  assert {
    condition     = module.test.project == "test-default-tf75-sb"
    error_message = "The project ID does not match the expected value 'test-default-tf75-sb'."
  }

  variables {
    project = "test-default-tf75-sb"
  }
}

run "dns" {
  command = apply

  module {
    source = "./tests/fixtures/default/dns"
  }

  variables {
    project = "test-default-tf75-sb"
  }
}

run "regional" {
  command = apply

  module {
    source = "./tests/fixtures/default/regional"
  }

  variables {
    project = "test-default-tf75-sb"
  }
}

run "regional_nat" {
  command = apply

  module {
    source = "./tests/fixtures/default/regional_nat"
  }

  variables {
    project = "test-default-tf75-sb"
  }
}
