# Local Values
# https://www.terraform.io/docs/configuration/locals.html

locals {
  rules = [
    {

      # This rule is to support the Google Cloud Load Balancer health check probes.
      # https://cloud.google.com/load-balancing/docs/health-checks#firewall_rules

      allow = [
        {
          ports    = []
          protocol = "tcp"
        }
      ]

      deny                = []
      description         = "Allow Google cloud probers"
      direction           = "INGRESS"
      log_config_enabled  = true
      log_config_metadata = "INCLUDE_ALL_METADATA"
      name                = "allow-google-cloud-probers"
      priority            = null

      ranges = [
        "130.211.0.0/22",
        "35.191.0.0/16",
        "209.85.152.0/22",
        "209.85.204.0/22"
      ]

      source_tags = null
      target_tags = null
    },

    {
      # This rule is to support remote SSH access via Google Cloud IAP.
      # https://cloud.google.com/iap/docs/using-tcp-forwarding

      allow = [
        {
          ports    = ["22"]
          protocol = "tcp"
        }
      ]

      deny                = []
      description         = "Allow SSH ingress from IAP"
      direction           = "INGRESS"
      name                = "allow-ssh-ingress-from-iap"
      log_config_enabled  = true
      log_config_metadata = "INCLUDE_ALL_METADATA"
      priority            = null
      ranges              = ["35.235.240.0/20"]
      source_tags         = null
      target_tags         = null
    }
  ]
}
