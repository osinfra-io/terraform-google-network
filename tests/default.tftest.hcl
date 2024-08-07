mock_provider "google" {}

run "default" {
  command = apply

  module {
    source = "./tests/fixtures/default"
  }

  # Example assertion

  assert {
    condition     = module.test.name == "mock-vpc"
    error_message = "The VPC name does not match the expected value 'mock-vpc'."
  }
}

run "dns" {
  command = apply

  module {
    source = "./tests/fixtures/default/dns"
  }
}

run "regional" {
  command = apply

  module {
    source = "./tests/fixtures/default/regional"
  }
}

run "regional_nat" {
  command = apply

  module {
    source = "./tests/fixtures/default/regional_nat"
  }
}

variables {
  project     = "mock-project"
  environment = "mock-environment"
}
