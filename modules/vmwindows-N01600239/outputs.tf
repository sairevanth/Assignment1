output "windows_public_ip_address"{
value=azurerm_windows_virtual_machine.my_terraform_azure_vm_machine.public_ip_address
}

output "windows_vm_names" {
  value=azurerm_windows_virtual_machine.my_terraform_azure_vm_machine.name
 }                                                                                                                                    

output "windows_private_ip_address"{
value=azurerm_windows_virtual_machine.my_terraform_azure_vm_machine.private_ip_address
}

output "VM_FQDN" {
value=azurerm_public_ip.public_ip_addr.fqdn
}
output "Windows_Domain_name"{
value=azurerm_public_ip.public_ip_addr.domain_name_label
}
output "windows_machine_id"{
value=azurerm_windows_virtual_machine.my_terraform_azure_vm_machine.id
}
 
