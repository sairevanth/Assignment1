resource "azurerm_postgresql_server" "example" {
  name                = var.db_Server_name
  location            = var.location
  resource_group_name = var.rg_name

  administrator_login          = var.admin_name
  administrator_login_password = var.password

  sku_name   = var.sku_name
  version    = var.product_version
  storage_mb = var.storage_mb

  backup_retention_days        = var.retention_period
  geo_redundant_backup_enabled = true
  auto_grow_enabled            = true

  public_network_access_enabled    = false
  ssl_enforcement_enabled          = true
  ssl_minimal_tls_version_enforced = var.minimal_tls_version
}
