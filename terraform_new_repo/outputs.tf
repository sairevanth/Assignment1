output "resource_group_name" {
  description = "Resource Group for holding resources"
  value       = module.ResourceGroup.rg_group_name
}

output "vnetwork_name" {
  description = "Virtual Network Name"
  value       = module.NetworkResource.vnet_name.name
}

output "vnet_address_space" {
  value = module.NetworkResource.vnet_name.address_space[0]
}

output "subnet_name" {
  value = module.NetworkResource.subnet1_name.name
}
output "subnet_address" {
  value = module.NetworkResource.subnet1_address_space.address_prefixes[0]
}

output "log_analytics_workspace_name" {
  value = module.CommonServices.log_analytics_service_name
}

output "recovery_services_vault_service_name" {
  value = module.CommonServices.recovery_services_vault_service_name
}
output "storage_account_name" {
  value = module.CommonServices.storage_account_name
}

output "linux_machine1_public_ip_address"{
  value =module.linux.linux_public_ip_address[0]
}


output "linux_machine2_public_ip_address"{
  value =module.linux.linux_public_ip_address[1]
}



output "linux_machine3_public_ip_address"{
  value =module.linux.linux_public_ip_address[2]
}

output "linux_vm_name1"{
value=module.linux.linux_vm_names[0]
}

output "linux_vm_name2"{
value=module.linux.linux_vm_names[1]
}


output "linux_vm_name3"{
value=module.linux.linux_vm_names[2]
}

output "linux_machine_private_ip_address1"{
value=module.linux.linux_private_ip_address[0]
}

output "linux_machine_private_ip_address2"{
value=module.linux.linux_private_ip_address[1]
}

output "linux_machine_private_ip_address3"{
value=module.linux.linux_private_ip_address[2]
}

output "linux_machine1_fqdn"{
value=module.linux.VM_FQDN[0]
}

output "linux_machine2_fqdn"{
value=module.linux.VM_FQDN[1]
}


output "linux_machine3_fqdn"{
value=module.linux.VM_FQDN[2]
}

output "windows_machine1_fqdn"{
value=module.windows.VM_FQDN
}


output "windows_machine1_private_ip"{
value=module.windows.windows_private_ip_address
}


output "windows_machine1_public_ip"{
value=module.windows.windows_public_ip_address

}

output "windows_Domain_name"{
value=module.windows.Windows_Domain_name
}

output "linux_domain_name1"{
value=module.linux.Domain_name[0]
}
output "linux_domain_name2"{
value=module.linux.Domain_name[1]
}
output "linux_domain_name3"{
value=module.linux.Domain_name[2]
}

output "linux_Machineid1"{
value= module.linux.Machineid[0]
}

output "linux_Machineid2"{
value= module.linux.Machineid[1]
}
output "linux_Machineid3"{
value= module.linux.Machineid[2]
}

output "load_balancer_name"{
value=module.load_balancer.loadbalancer_name
}
output "database_name"{
value=module.database.database_name
}
