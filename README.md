# gd-child-rg: Azure Resource Group Terraform Module

This child module creates and manages an Azure Resource Group with optional management locks (`CanNotDelete`, `ReadOnly`) and standardized metadata tagging.

Part of the **Azure Parent–Child Infrastructure Architecture** under GitHub account `gauravdubey5`.

## Features

- Standardized Azure Resource Group provisioning
- Strict name validation adhering to Azure naming conventions (1–90 chars, no trailing period)
- Optional deletion and read-only protection locks (`CanNotDelete` / `ReadOnly`)
- Standardized metadata tagging support
- Fully compatible with Terraform `>= 1.5.0` and AzureRM provider `>= 3.75.0, < 5.0.0`

## Prerequisites

- Terraform CLI `>= 1.5.0`
- Azure CLI authenticated to your target subscription or Azure DevOps service connection

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| `name` | Name of the Resource Group (1-90 characters, cannot end with period) | `string` | n/a | yes |
| `location` | Azure Region (e.g. `eastus2`, `centralindia`) | `string` | n/a | yes |
| `tags` | Map of tags to apply to the resource group | `map(string)` | `{}` | no |
| `lock_level` | Optional lock level: `CanNotDelete` or `ReadOnly` | `string` | `null` | no |
| `lock_name` | Custom name for the management lock | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| `id` | The Resource ID of the Resource Group |
| `name` | The Name of the Resource Group |
| `location` | The Azure Region of the Resource Group |
| `tags` | The tags assigned to the Resource Group |

## Example Usage

```hcl
module "rg" {
  source = "git::https://github.com/gauravdubey5/gd-child-rg.git?ref=v1.0.0"

  name       = "rg-enterprise-dev-001"
  location   = "eastus2"
  lock_level = "CanNotDelete"

  tags = {
    Environment = "dev"
    Project     = "CloudPlatform"
    ManagedBy   = "Terraform"
  }
}
```

## Security Considerations

- **Deletion Protection**: Enable `lock_level = "CanNotDelete"` in production environments to prevent accidental deletion of critical stateful workloads.
- **RBAC Boundaries**: Resource Groups establish the primary authorization boundary in Azure. Ensure least-privilege role assignments are applied at or below this level.

## Cost Considerations

- Resource Groups are metadata containers in Azure and incur **$0.00 / month** in ongoing charges.

## Testing & Verification

Run module syntax and validation checks:

```bash
terraform fmt -check
terraform init -backend=false
terraform validate
terraform test
```

## Versioning & Releases

This module follows [Semantic Versioning](https://semver.org/). Always pin module references to Git release tags (`?ref=v1.0.0`) in parent environments.
