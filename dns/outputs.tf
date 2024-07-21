output "name" {
  description = "The DNS zone name"
  value       = google_dns_managed_zone.this.name
}

output "dns_name" {
  description = "The DNS zone domain name"
  value       = google_dns_managed_zone.this.dns_name
}

output "name_servers" {
  description = "The DNS zone name servers"
  value       = google_dns_managed_zone.this.name_servers
}
