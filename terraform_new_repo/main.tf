locals {
  student_id = "n01600239"
  location   = "UK West"
  tags = {
    Assignment     = "CCGC 5502 Automation Assignment"
    Name           = "sairevanth.muppana"
    ExpirationDate = "2024-12-31"
    Environment    = "Learning"
  }
}

module "ResourceGroup" {
  source                  = "./modules/resource_group-n01600239"
  resource_group_name     = "rgroup_${local.student_id}"
  resource_group_location = local.location
  resource_tags           = local.tags
}

module "NetworkResource" {
  source                       = "./modules/network-n01600239"
  resource_group_name          = "rgroup_${local.student_id}"
  location                     = local.location
  virtual_network_name         = "${local.student_id}_virtual_network"
  virtual_address_space1       = ["10.0.0.0/16"]
  subnet1_name                 = "${local.student_id}-subnet"
  subnet1_address_space        = ["10.0.0.0/24"]
  network_security_group1_name = "net_security_group"
  resource_tags                = local.tags
}


module "CommonServices" {
  source                  = "./modules/common_services-n01600239"
  resource_group_name     = module.ResourceGroup.rg_group_name
  resource_group_location = local.location
  log_analytics_workspace = {
    law_name  = "${local.student_id}-law"
    log_sku   = "PerGB2018"
    retention = "30"

  }
  recovery_services_vault = {
    vault_name = "${local.student_id}-vaultname"
    vault_sku  = "Standard"
  }
  storage_account_info = {
    storage_account_name     = "${local.student_id}stgacc"
    account_tier             = "Standard"
    account_replication_type = "LRS"
  }

  resource_tags = local.tags

}


module "linux" {
depends_on =[module.CommonServices,module.ResourceGroup]
  source                          = "./modules/vmlinux-n01600239"
  linux_name                      = "${local.student_id}-u-vm"
  availibility_set                = "linux-avs"
  nb_count                        = 3
  location                        = local.location
  subnet_id                       = module.NetworkResource.subnet_ids
  rg_name                         = module.ResourceGroup.rg_group_name
  boot_diagnostics_storage_account_uri=module.CommonServices.primary_blob_endpoint
  resource_tags                   = local.tags
  size                            = "Standard_D2s_v3"
  admin_user_name                 = "${local.student_id}"
  public_key_path                 = "/home/N01600239/.ssh/id_rsa.pub"
  private_key                     = "/home/N01600239/.ssh/id_rsa"
  os_disk_caching                 = "ReadWrite"
  os_disk_type                    = "Standard_LRS"
  storage_account_name            = module.CommonServices.storage_account_name
  extension_name1                 = "NetworkWatcherAgentLinux"
  extension1_publisher            = "Microsoft.Azure.NetworkWatcher"
  extension1_type                 = "NetworkWatcherAgentLinux"
  extension1_type_handler_version = "1.0"
  extension_name2                 = "AzureMonitorLinuxAgent"
  extension2_publisher            = "Microsoft.Azure.Monitor"
  extension2_type                 = "AzureMonitorLinuxAgent"
  extension2_type_handler_version = "1.0"
  os_publisher = "OpenLogic"
  os_offer     = "CentOS"
  os_sku       = "8_2"
  os_version   = "Latest"
domain_name_label_prefix="n01600239"
}

module "windows"{
  source                          = "./modules/vmwindows-N01600239"
rg_group_name=module.ResourceGroup.rg_group_name
rg_group_location=local.location
availability_set="windows_availibility_set"
subnet_id=module.NetworkResource.subnet_ids
admin_user_name="n01600239"
os_disk_type="StandardSSD_LRS"
os_disk_caching="ReadWrite"
os_publisher="MicrosoftWindowsServer"
os_offer="WindowsServer"
os_sku="2016-Datacenter"
os_version="latest"
windows_name="vmwin-239"
size="Standard_F2"
platform_fault_domain_count="2"
update_domain_count="5"
extension_name1="AntimalwareConfiguration"
extension1_publisher="Microsoft.Azure.Security"
extension1_type="IaaSAntimalware"
extension1_type_handler_version="1.3"
resource_tags = local.tags
domain_name_label_prefix="n01600239"
}

module "disks"{
  source                          = "./modules/datadisk-n01600239"
rg_name=module.ResourceGroup.rg_group_name
location=local.location
resource_tags=local.tags
storage_account_type="Standard_LRS"
  create_option        = "Empty"
  disk_size         = 10
linux_data_disk_count=3
data_disk_name="n01600239"
linux_machine_id=module.linux.Machineid
windows_machine_id=module.windows.windows_machine_id
}

module "load_balancer"{

  source                          ="./modules/loadbalancer_v01600239"
  location  =local.location
rg_name=module.ResourceGroup.rg_group_name
resource_tags=local.tags
Machineid1=module.linux.linux_private_ip_address[0]
Machineid2=module.linux.linux_private_ip_address[1]
Machineid3=module.linux.linux_private_ip_address[2]
virtual_network_address=module.NetworkResource.vnet_id

}

module "database"{
source="./modules/database-n01600239"
db_Server_name="postgre-00239"
location=local.location
rg_name=module.ResourceGroup.rg_group_name
admin_name="n01600239"
password="database@123"
sku_name="GP_Gen5_4"
product_version="11"
storage_mb=640000
retention_period=7
minimal_tls_version="TLS1_2"
}

