locals {

  log_categories = (
    var.log_categories != null ?
    var.log_categories :
    data.azurerm_monitor_diagnostic_categories.main.log_category_types
  )

  # Each metric can be defined with a status enabled or not.
  # If the user provides metrics, only those provided are enabled. Other are defined disabled.
  # If the user doesn't provide any metrics, all metrics are activated.
  metric_categories = {
    for metric in data.azurerm_monitor_diagnostic_categories.main.metrics :
      metric => var.metric_categories != null ? contains(var.metric_categories, metric) : true
  }

  # The user can disable logs and metrics.
  logs    = var.enable_logs ? local.log_categories : []
  metrics = var.enable_metrics ? local.metric_categories : {for metric, _ in local.metric_categories: metric => false}
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
      category = enabled_log.value
    }
  }

  dynamic "metric" {
    for_each = local.metrics

    content {
      category = metric.key
      enabled  = metric.value
    }
  }
}