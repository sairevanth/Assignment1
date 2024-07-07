resource "azurerm_managed_disk" "windowsdisk" {
  name                 = "${var.data_disk_name}_windows_disk"
  location             = var.location
  resource_group_name  = var.rg_name
  storage_account_type = var.storage_account_type
  create_option        = var.create_option
  disk_size_gb         = var.disk_size
  tags=var.resource_tags
}

resource "azurerm_virtual_machine_data_disk_attachment" "windowsdiskattachment" {
 managed_disk_id    = azurerm_managed_disk.windowsdisk.id
  virtual_machine_id = var.windows_machine_id
  lun                = 15
  caching            = "ReadWrite"
}
