# Terraform Output Values
# https://www.terraform.io/language/values/outputs

output "name" {
  description = "The name of the cloud nat resources"
  value       = local.name
}

output "project" {
  description = "The project ID"
  value       = var.project
}
