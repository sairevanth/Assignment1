resource "azurerm_log_analytics_workspace" "log_analytics_workspace" {
  name                = var.log_analytics_workspace["law_name"]
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  sku                 = var.log_analytics_workspace["log_sku"]
  retention_in_days   = var.log_analytics_workspace["retention"]
  tags = var.resource_tags
}

resource "azurerm_recovery_services_vault" "recovery_services_vault" {
  name                = var.recovery_services_vault["vault_name"]
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  sku                 = var.recovery_services_vault["vault_sku"]
  soft_delete_enabled = true
  tags = var.resource_tags
}

resource "azurerm_storage_account" "azure_storage_account" {
  name                     = var.storage_account_info["storage_account_name"]
  resource_group_name      = var.resource_group_name
  location                 = var.resource_group_location
  account_tier             = var.storage_account_info["account_tier"]
  account_replication_type = var.storage_account_info["account_replication_type"]
  tags                     = var.resource_tags
}
