resource "null_resource" "remote_command_exec" {
  count = var.nb_count

  provisioner "remote-exec" {
    inline = [
      "/usr/bin/hostname"
    ]
    connection {
      type        = "ssh"
      user        = var.admin_user_name
      private_key = file(var.private_key)
      host        = element(azurerm_linux_virtual_machine.my_terraform_azure_vm_machine[*].public_ip_address, count.index + 1)
    }
  }
}
