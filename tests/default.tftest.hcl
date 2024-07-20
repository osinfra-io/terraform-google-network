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

  assert {
    condition     = module.test.self_link == "https://www.googleapis.com/compute/v1/projects/test-default-tf75-sb/global/networks/test-vpc"
    error_message = "The self link does not match the expected URL."
  }

  variables {
    project = "test-default-tf75-sb"
  }
}
