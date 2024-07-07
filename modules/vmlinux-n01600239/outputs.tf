output "linux_public_ip_address" {
  value = [for vm in azurerm_linux_virtual_machine.my_terraform_azure_vm_machine : vm.public_ip_address]
}

output "linux_vm_names" {
  value = [for vm in azurerm_linux_virtual_machine.my_terraform_azure_vm_machine : vm.name]
}

output "linux_private_ip_address" {
  value = [for vm in azurerm_linux_virtual_machine.my_terraform_azure_vm_machine : vm.private_ip_address]
}


output "VM_FQDN"{
value=azurerm_public_ip.public_ip_addr[*].fqdn
}

output "Domain_name"{
value=azurerm_public_ip.public_ip_addr[*].domain_name_label
}
output "Machineid"{
value=azurerm_linux_virtual_machine.my_terraform_azure_vm_machine[*].id
}
