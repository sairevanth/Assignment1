variable "resource_group_name" {
  type = string
}

variable "resource_group_location" {
  type = string
}

variable "log_analytics_workspace" {
  type = map(string)
}
variable "resource_tags" {
  type = map(string)
}

variable "recovery_services_vault" {
  type = map(string)
}

variable "storage_account_info" {
  type = map(string)
}
