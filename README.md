# Summary

[![Build Status](https://dev.azure.com/weareretail/Tooling/_apis/build/status/mod_azu_tags?repoName=mod_azu_monitor_diagnostic_setting&branchName=master)](https://dev.azure.com/weareretail/Tooling/_build/latest?definitionId=2&repoName=mod_azu_monitor_diagnostic_setting&branchName=master)[![Unilicence](https://img.shields.io/badge/licence-The%20Unilicence-green)](LICENCE)

This module configure the monitoring diagnostic settings of an existing resource.

If not specified, all metrics and logs will be enabled.

# Usage

```
module "diagnostic_settings" {
  source = "./modules/mod_azu_monitor_diagnostic_setting"

  caf_prefixes = module.agents_naming.resource_prefixes

  resource_id = azurerm_key_vault.example.id

  retention_days = 30

  storage_account_id = azurerm_storage_account.main.id
}
```

## Arguments

| Name | Type | Description |
| --- | --- | --- |
| `description` | `string` | The resource description. |
| `caf_prefixes` | `list(string)` | Prefixes to use for caf naming. |
| `resource_id` | `string` | The ID of the resource. |
| `log_categories` | `list` | List of log categories. |
| `metric_categories` | `list` | List of metric categories. |
| `retention_days` | `number` | The number of days to keep diagnostic logs. |
| `storage_account_id` | `string` | The ID of the storage account to send diagnostic logs to. |
| `log_analytics_workspace_id` | `string` | The ID of the Log Analytics workspace to send diagnostic logs to. | 

<!-- BEGIN_TF_DOCS -->
#### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_azurecaf"></a> [azurecaf](#requirement\_azurecaf) | >= 1.2.16 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.44.0 |

#### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_resource_id"></a> [resource\_id](#input\_resource\_id) | The ID of the resource. | `string` | n/a | yes |
| <a name="input_caf_prefixes"></a> [caf\_prefixes](#input\_caf\_prefixes) | Prefixes to use for caf naming. | `list(string)` | `[]` | no |
| <a name="input_description"></a> [description](#input\_description) | Monitoring diagnostic settings | `string` | `""` | no |
| <a name="input_enable_metrics"></a> [enable\_metrics](#input\_enable\_metrics) | Either `true` to enable diagnostic settings or `false` to disable it. | `bool` | `true` | no |
| <a name="input_log_analytics_destination_type"></a> [log\_analytics\_destination\_type](#input\_log\_analytics\_destination\_type) | When set to 'Dedicated' logs sent to a Log Analytics workspace will go into resource specific tables, instead of the legacy AzureDiagnostics table. | `string` | `"AzureDiagnostics"` | no |
| <a name="input_log_analytics_workspace_id"></a> [log\_analytics\_workspace\_id](#input\_log\_analytics\_workspace\_id) | The ID of the Log Analytics workspace to send diagnostic logs to. | `string` | `null` | no |
| <a name="input_log_categories"></a> [log\_categories](#input\_log\_categories) | List of log categories. | `list(any)` | `null` | no |
| <a name="input_metric_categories"></a> [metric\_categories](#input\_metric\_categories) | List of metric categories. | `list(any)` | `null` | no |
| <a name="input_retention_days"></a> [retention\_days](#input\_retention\_days) | The number of days to keep diagnostic logs. | `number` | `null` | no |
| <a name="input_storage_account_id"></a> [storage\_account\_id](#input\_storage\_account\_id) | The ID of the storage account to send diagnostic logs to. | `string` | `null` | no |

#### Outputs

| Name | Description |
|------|-------------|
| <a name="output_diag_setting_id"></a> [diag\_setting\_id](#output\_diag\_setting\_id) | n/a |
| <a name="output_diag_setting_name"></a> [diag\_setting\_name](#output\_diag\_setting\_name) | n/a |
<!-- END_TF_DOCS -->