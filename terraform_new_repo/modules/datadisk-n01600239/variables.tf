variable "rg_name" {
  type        = string
  description = "This Block is used for Network resource group naming"
}

variable "location" {
  type        = string
  description = "This Block is used for the Resource Group Location Naming"
}
variable "resource_tags" {
  type        = map(string)
  description = "tags for resources"
}

variable "data_disk_name"{
type=string
}
variable "linux_data_disk_count"{
 type = string
}
variable "storage_account_type"{
 type =string
}

variable "create_option"{
type=string
}

variable "disk_size"{
type=string
}
variable "linux_machine_id" {
  description = "List of Linux machine IDs"
  type        = list(string)
}

variable "windows_machine_id"{
type=string
}
