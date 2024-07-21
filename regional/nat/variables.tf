# Terraform Input Variables
# https://www.terraform.io/language/values/variables

variable "network" {
  description = "The network to enable Cloud NAT on"
  type        = string
}

variable "prefix" {
  description = "The prefix for the resource name.  Defaults to var.network"
  type        = string
  default     = ""
}

variable "project" {
  description = "The ID of the project in which the resource belongs"
  type        = string
}

variable "region" {
  description = "The region in which the resource belongs"
  type        = string
}

variable "source_subnetwork_ip_ranges_to_nat" {
  description = "How NAT should be configured per Subnetwork.  Possible values are ALL_SUBNETWORKS_ALL_IP_RANGES, ALL_SUBNETWORKS_ALL_PRIMARY_IP_RANGES, and LIST_OF_SUBNETWORKS"
  type        = string
  default     = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}

variable "subnetwork_names" {
  description = "Subnet names for NAT configuration.  Only used if source_subnetwork_ip_ranges_to_nat is set to LIST_OF_SUBNETWORKS"
  type        = list(string)
  default     = []
}
