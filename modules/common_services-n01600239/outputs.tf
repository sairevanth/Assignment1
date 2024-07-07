output "log_analytics_service_name" {
  value = azurerm_log_analytics_workspace.log_analytics_workspace.name
}
output "recovery_services_vault_service_name" {
  value = azurerm_recovery_services_vault.recovery_services_vault.name
}

output "storage_account_name" {
  value = azurerm_storage_account.azure_storage_account.name
}

output "primary_blob_endpoint" {
  value = azurerm_storage_account.azure_storage_account.primary_blob_endpoint
}
