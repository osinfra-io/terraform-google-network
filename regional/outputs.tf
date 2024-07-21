# Output Values
# https://www.terraform.io/language/values/outputs

output "project" {
  description = "The project ID"
  value       = var.project
}

output "name" {
  description = "The name of the subnetwork"
  value       = google_compute_subnetwork.this.name
}
