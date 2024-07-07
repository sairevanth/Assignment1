resource "azurerm_public_ip" "public_ip_addr" {
  name                =   "${var.windows_name}_public_ip_address"
  location            = var.rg_group_location
  resource_group_name = var.rg_group_name
  allocation_method   = "Dynamic"
   domain_name_label   =var.domain_name_label_prefix
}



# Create network interface
resource "azurerm_network_interface" "my_terraform_nic" {
name                = "${var.windows_name}_my_nic"
  location            = var.rg_group_location
  resource_group_name =  var.rg_group_name

  ip_configuration {
    name                          = "my_nic_configuration"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip_addr.id
  }
  tags                       = var.resource_tags
}



resource "azurerm_windows_virtual_machine" "my_terraform_azure_vm_machine" {
  name                = var.windows_name
  resource_group_name = var.rg_group_name
  location            = var.rg_group_location
  size                = var.size
  admin_username      = var.admin_user_name
    admin_password      = "P@$$w0rd1234!"
  network_interface_ids = [azurerm_network_interface.my_terraform_nic.id]
  os_disk {
name= "my_os_disk"
    caching              = var.os_disk_caching
    storage_account_type = var.os_disk_type
  }
 tags                       = var.resource_tags
  source_image_reference {
    publisher = var.os_publisher
    offer     = var.os_offer
    sku       = var.os_sku
    version   = var.os_version
  }
computer_name =var.windows_name


  winrm_listener {
    protocol = "Http"
  }
}


resource "azurerm_availability_set" "windows_availibility_set" {
  name                = "${var.windows_name}_availibility_set"
  location            = var.rg_group_location
  resource_group_name = var.rg_group_name
  platform_fault_domain_count  = var.platform_fault_domain_count
  platform_update_domain_count = var.update_domain_count
 tags                       = var.resource_tags
}

resource "azurerm_virtual_machine_extension" "Network_Watcher_extension" {
  name                       = var.extension_name1
  virtual_machine_id         = azurerm_windows_virtual_machine.my_terraform_azure_vm_machine.id
  publisher                  = var.extension1_publisher
  type                       = var.extension1_type
  type_handler_version       = var.extension1_type_handler_version
  auto_upgrade_minor_version = true
  tags                       = var.resource_tags
}
