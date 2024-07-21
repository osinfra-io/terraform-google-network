# Terraform Output Values
# https://www.terraform.io/language/values/outputs

output "name" {
  value = module.all_subnets_test.name
}

output "project" {
  value = module.all_subnets_test.project
}
