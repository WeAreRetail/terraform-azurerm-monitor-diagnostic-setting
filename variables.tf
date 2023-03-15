variable "description" {
  type        = string
  default     = ""
  description = "Monitoring diagnostic settings"
}

variable "caf_prefixes" {
  type        = list(string)
  default     = []
  description = "Prefixes to use for caf naming."
}

variable "resource_id" {
  type        = string
  description = "The ID of the resource."
}

variable "log_categories" {
  type        = list(any)
  default     = null
  description = "List of log categories."
}

variable "metric_categories" {
  type        = list(any)
  default     = null
  description = "List of metric categories."
}

variable "enable_metrics" {
  type        = bool
  default     = true
  description = "Either `true` to enable diagnostic settings or `false` to disable it."
}

variable "retention_days" {
  type        = number
  default     = null
  description = "The number of days to keep diagnostic logs."
}

variable "storage_account_id" {
  type        = string
  default     = null
  description = "The ID of the storage account to send diagnostic logs to."
}

variable "log_analytics_workspace_id" {
  type        = string
  default     = null
  description = "The ID of the Log Analytics workspace to send diagnostic logs to."
}

variable "log_analytics_destination_type" {
  type        = string
  default     = "AzureDiagnostics"
  description = "When set to 'Dedicated' logs sent to a Log Analytics workspace will go into resource specific tables, instead of the legacy AzureDiagnostics table."
}
