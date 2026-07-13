# Input Variables
# https://opentofu.org/docs/language/values/variables

variable "environment" {
  description = "The environment name for the deployment"

  type = string
}

variable "project" {
  description = "The Google Cloud project ID"

  type = string
}
