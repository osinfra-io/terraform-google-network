# Terraform Output Values
# https://www.terraform.io/language/values/outputs

output "name" {
  value = module.test.name
}

output "project" {
  value = module.test.project
}
