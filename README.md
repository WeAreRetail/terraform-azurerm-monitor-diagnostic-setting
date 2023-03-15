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
