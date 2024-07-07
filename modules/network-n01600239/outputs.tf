output "vnet_name" {
  value = azurerm_virtual_network.Terraform-Resources-vnet
}
output "vnet_address_space" {
  description = "The address space of the Virtual Network"
  value       = azurerm_virtual_network.Terraform-Resources-vnet.address_space
}
output "vnet_id"{
value=azurerm_virtual_network.Terraform-Resources-vnet.id
}
output "subnet1_name" {
  description = "The name of the first subnet"
  value       = azurerm_subnet.Terraform-Resources-Subnet
}
output "subnet_ids" {
  value = azurerm_subnet.Terraform-Resources-Subnet.id
}

output "subnet1_address_space" {
  description = "The address space of the first subnet"
  value       = azurerm_subnet.Terraform-Resources-Subnet
}

output "network_security_group1_name" {
  value = azurerm_network_security_group.Terraform_Security_Group
}
