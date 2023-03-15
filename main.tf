locals {

  log_categories = (
    var.log_categories != null ?
    var.log_categories :
    data.azurerm_monitor_diagnostic_categories.main.log_category_types
  )

  metric_categories = (
    var.metric_categories != null ?
    var.metric_categories :
    data.azurerm_monitor_diagnostic_categories.main.metrics
  )

  logs = {
    for category in local.log_categories : category => {
      retention_days = var.retention_days
    }
  }

  metrics = {
    for metric in local.metric_categories : metric => {
      enabled        = var.enable_metrics
      retention_days = var.retention_days
    }
  }

}

data "azurerm_monitor_diagnostic_categories" "main" {
  resource_id = var.resource_id
}


resource "azurecaf_name" "self" {
  name          = "amds"
  prefixes      = var.caf_prefixes
  resource_type = "general"
  suffixes      = []
  random_length = 3
  use_slug      = false
  clean_input   = true
  separator     = ""
}

resource "azurerm_monitor_diagnostic_setting" "main" {
  name               = azurecaf_name.self.result
  target_resource_id = var.resource_id

  storage_account_id         = var.storage_account_id
  log_analytics_workspace_id = var.log_analytics_workspace_id

  log_analytics_destination_type = var.log_analytics_destination_type

  dynamic "enabled_log" {
    for_each = local.logs

    content {
      category = enabled_log.key

      retention_policy {
        enabled = enabled_log.value.retention_days != null ? true : false
        days    = enabled_log.value.retention_days
      }
    }
  }

  dynamic "metric" {
    for_each = local.metrics

    content {
      category = metric.key
      enabled  = metric.value.enabled

      retention_policy {
        enabled = metric.value.retention_days != null ? true : false
        days    = metric.value.retention_days
      }
    }
  }
}
