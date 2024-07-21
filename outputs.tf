# Output Values
# https://www.terraform.io/docs/language/values/outputs.html

output "name" {
  description = "The network name"
  value       = google_compute_network.this.name
}

output "project" {
  description = "The ID of the project in which the resource belongs"
  value       = var.project
}

output "self_link" {
  description = "The URI of the created resource"
  value       = google_compute_network.this.self_link
}
