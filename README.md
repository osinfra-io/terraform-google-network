# <img align="left" width="45" height="45" src="https://github.com/user-attachments/assets/b1a10251-0c34-41c9-ac8c-edd79dbfaf07"> Google Cloud Platform - Network Module

**[GitHub Actions](https://github.com/osinfra-io/terraform-google-network/actions):**

[![Terraform Tests](https://github.com/osinfra-io/terraform-google-network/actions/workflows/test.yml/badge.svg)](https://github.com/osinfra-io/terraform-google-network/actions/workflows/test.yml) [![Dependabot](https://github.com/osinfra-io/terraform-google-network/actions/workflows/dependabot.yml/badge.svg)](https://github.com/osinfra-io/terraform-google-network/actions/workflows/dependabot.yml)

**[Infracost](https://www.infracost.io):**

[![infracost](https://img.shields.io/endpoint?url=https://dashboard.api.infracost.io/shields/json/cbeecfe3-576f-4553-984c-e451a575ee47/repos/12f405c3-d54f-4d40-bc56-f77915992342/branch/033eda30-5251-4ab9-bc73-c1a963174a53)](https://dashboard.infracost.io/org/osinfra-io/repos/12f405c3-d54f-4d40-bc56-f77915992342?tab=settings)

💵 Monthly estimates based on Infracost baseline costs.

## Repository Description

Terraform **example** module for a Google Cloud Platform network.

> [!NOTE]
> We do not recommend consuming this module like you might a [public module](https://registry.terraform.io/browse/modules). It is a baseline, something you can fork, potentially maintain, and modify to fit your organization's needs. Using public modules vs. writing your own has various [drivers and trade-offs](https://docs.osinfra.io/fundamentals/architecture-decision-records/adr-0003) that your organization should evaluate.

## 🔩 Usage

> [!TIP]
> You can check the [tests/fixtures](tests/fixtures) directory for example configurations. These fixtures set up the system for testing by providing all the necessary initial code, thus creating good examples on which to base your configurations.

## <img align="left" width="35" height="35" src="https://github.com/osinfra-io/github-organization-management/assets/1610100/39d6ae3b-ccc2-42db-92f1-276a5bc54e65"> Development

Our focus is on the core fundamental practice of platform engineering, Infrastructure as Code.

>Open Source Infrastructure (as Code) is a development model for infrastructure that focuses on open collaboration and applying relative lessons learned from software development practices that organizations can use internally at scale. - [Open Source Infrastructure (as Code)](https://www.osinfra.io)

To avoid slowing down stream-aligned teams, we want to open up the possibility for contributions. The Open Source Infrastructure (as Code) model allows team members external to the platform team to contribute with only a slight increase in cognitive load. This section is for developers who want to contribute to this repository, describing the tools used, the skills, and the knowledge required, along with Terraform documentation.

See the documentation for setting up a local development environment [here](https://docs.osinfra.io/fundamentals/development-setup).

### 🛠️ Tools

- [checkov](https://github.com/bridgecrewio/checkov)
- [infracost](https://github.com/infracost/infracost)
- [pre-commit](https://github.com/pre-commit/pre-commit)
- [pre-commit-terraform](https://github.com/antonbabenko/pre-commit-terraform)
- [terraform-docs](https://github.com/terraform-docs/terraform-docs)

### 📋 Skills and Knowledge

Links to documentation and other resources required to develop and iterate in this repository successfully.

- [cloud dns](https://cloud.google.com/dns/docs)
- [cloud nat](https://cloud.google.com/nat/docs/overview)
- [firewall](https://cloud.google.com/vpc/docs/firewalls)
- [shared vpc](https://cloud.google.com/vpc/docs/shared-vpc)
- [subnets](https://cloud.google.com/vpc/docs/subnets)
- [vpc](https://cloud.google.com/vpc/docs/vpc)

### 🔍 Tests

All tests are [mocked](https://developer.hashicorp.com/terraform/language/tests/mocking) allowing us to test the module without creating infrastructure or requiring credentials. The trade-offs are acceptable in favor of speed and simplicity. In a Terraform test, a mocked provider or resource will generate fake data for all computed attributes that would normally be provided by the underlying provider APIs.

```none
terraform init
```

```none
terraform test
```

## 📓 Terraform Documentation

> A child module automatically inherits default (un-aliased) provider configurations from its parent. The provider versions below are informational only and do **not** need to align with the provider configurations from its parent.

<!-- BEGIN_TF_DOCS -->
### Providers

| Name | Version |
|------|---------|
| google | 6.2.0 |

### Resources

| Name | Type |
|------|------|
| [google_compute_firewall.rules](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_compute_network.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network) | resource |
| [google_compute_shared_vpc_host_project.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_shared_vpc_host_project) | resource |
| [google_compute_shared_vpc_service_project.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_shared_vpc_service_project) | resource |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | Name of the network to create | `string` | `"osinfra-vpc"` | no |
| project | The ID of the project in which the resource belongs | `string` | n/a | yes |
| rules | List of firewall rule definitions | ```list(object({ allow = optional(list(object({ ports = list(string) protocol = string })), []) deny = optional(list(object({ ports = list(string) protocol = string })), []) description = optional(string) direction = string log_config_enabled = optional(bool, true) log_config_metadata = optional(string, "INCLUDE_ALL_METADATA") name = string priority = optional(number) ranges = optional(list(string)) source_tags = optional(list(string)) target_tags = optional(list(string)) }))``` | `[]` | no |
| shared\_vpc | Enable VPC sharing | `bool` | `false` | no |
| shared\_vpc\_service\_projects | The set of service projects to attach to the shared VPC | `set(string)` | `[]` | no |

### Outputs

| Name | Description |
|------|-------------|
| name | The network name |
| self\_link | The URI of the created resource |
<!-- END_TF_DOCS -->
