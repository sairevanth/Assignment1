resource "azurerm_managed_disk" "example" {
  count= var.linux_data_disk_count
  name                 = "${var.data_disk_name}_${format("%1d",count.index+1)}"
  location             = var.location
  resource_group_name  = var.rg_name
  storage_account_type = var.storage_account_type
  create_option        = var.create_option
  disk_size_gb         = var.disk_size
  tags=var.resource_tags
}

resource "azurerm_virtual_machine_data_disk_attachment" "example" {
 count=var.linux_data_disk_count
 managed_disk_id    = azurerm_managed_disk.example[count.index].id
  virtual_machine_id = var.linux_machine_id[count.index % length(var.linux_machine_id)]
  lun                = 10+count.index
  caching            = "ReadWrite"
}

