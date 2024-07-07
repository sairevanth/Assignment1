resource "azurerm_public_ip" "public_ip_addr" {
  count               = var.nb_count
  name                = "${var.linux_name}-pip-${format("%1d", count.index + 1)}"
  location            = var.location
  resource_group_name = var.rg_name
  allocation_method   = "Dynamic"
 domain_name_label="${var.domain_name_label_prefix}${format("%02d", count.index + 1)}"
}

resource "azurerm_network_interface" "my_terraform_nic" {
  count               = var.nb_count
  name                = "${var.linux_name}-nic${format("%1d", count.index + 1)}"
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = "my_nic_configuration_${format("%1d", count.index + 1)}"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip_addr[count.index].id
  }
}
resource "azurerm_linux_virtual_machine" "my_terraform_azure_vm_machine" {
  count               = var.nb_count
  name                = "${var.linux_name}_${format("%1d", count.index + 1)}"
  resource_group_name = var.rg_name
  location            = var.location
  size                = var.size
  admin_username      = var.admin_user_name
  network_interface_ids = [
    azurerm_network_interface.my_terraform_nic[count.index].id,
  ]

  admin_ssh_key {
    username   = var.admin_user_name
    public_key = file(var.public_key_path)
  }

  os_disk {
    name                 = "${var.linux_name}_${format("%1d", count.index + 1)}_os_disk"
    caching              = var.os_disk_caching
    storage_account_type = var.os_disk_type
  }

  source_image_reference {
    publisher = var.os_publisher
    offer     = var.os_offer
    sku       = var.os_sku
    version   = var.os_version
  }
boot_diagnostics{
storage_account_uri=var.boot_diagnostics_storage_account_uri
}
  computer_name       = "${var.linux_name}${format("%1d", count.index + 1)}"
  availability_set_id = azurerm_availability_set.linux_availibility_set.id
depends_on=[azurerm_availability_set.linux_availibility_set]

}

resource "azurerm_availability_set" "linux_availibility_set" {
  name                         = "${var.linux_name}_linux_avs"
  location                     = var.location
  resource_group_name          = var.rg_name
  platform_fault_domain_count  = 2
  platform_update_domain_count = 5
}


resource "azurerm_virtual_machine_extension" "Network_Watcher_extension" {
  count                      = var.nb_count
  name                       = var.extension_name1
  virtual_machine_id         = element(azurerm_linux_virtual_machine.my_terraform_azure_vm_machine[*].id, count.index)
  publisher                  = var.extension1_publisher
  type                       = var.extension1_type
  type_handler_version       = var.extension1_type_handler_version
  auto_upgrade_minor_version = true
  tags                       = var.resource_tags
}

