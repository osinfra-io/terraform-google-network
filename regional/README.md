# Terraform Documentation

A child module automatically inherits its parent's default (un-aliased) provider configurations. The provider versions below are informational only and do **not** need to align with the provider configurations from its parent.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 5.40.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_compute_subnetwork.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ip_cidr_range"></a> [ip\_cidr\_range](#input\_ip\_cidr\_range) | The range of internal addresses that are owned by this subnetwork | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the resource, provided by the client when initially creating the resource. The resource name must be 1-63 characters long, and comply with RFC1035 | `string` | n/a | yes |
| <a name="input_network"></a> [network](#input\_network) | The network this subnet belongs to. Only networks that are in the distributed mode can have subnetworks | `string` | n/a | yes |
| <a name="input_private_ip_google_access"></a> [private\_ip\_google\_access](#input\_private\_ip\_google\_access) | When enabled, VMs in this subnetwork without external IP addresses can access Google APIs and services by using Private Google Access | `bool` | `null` | no |
| <a name="input_project"></a> [project](#input\_project) | The ID of the project in which the resource belongs | `string` | n/a | yes |
| <a name="input_purpose"></a> [purpose](#input\_purpose) | The purpose of the resource. This field can be either `PRIVATE_RFC_1918`, `INTERNAL_HTTPS_LOAD_BALANCER` or `REGIONAL_MANAGED_PROXY` | `string` | `null` | no |
| <a name="input_region"></a> [region](#input\_region) | The region in which the resource belongs | `string` | n/a | yes |
| <a name="input_role"></a> [role](#input\_role) | The role of subnetwork. The value can be set to `ACTIVE` or `BACKUP` | `string` | `null` | no |
| <a name="input_secondary_ip_ranges"></a> [secondary\_ip\_ranges](#input\_secondary\_ip\_ranges) | An array of configurations for secondary IP ranges for VM instances contained in this subnetwork | <pre>list(object({<br>    ip_cidr_range = string<br>    range_name    = string<br>  }))</pre> | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_name"></a> [name](#output\_name) | The name of the subnetwork |
| <a name="output_project"></a> [project](#output\_project) | The project ID |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
