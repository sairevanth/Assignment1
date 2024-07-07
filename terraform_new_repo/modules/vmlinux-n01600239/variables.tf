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

variable "nb_count" {
  type = number
}

variable "linux_name" {
  type = string
}
variable "domain_name_label_prefix" {
  description = "Prefix for DNS label"
  type        = string
}
variable "subnet_id" {
  type = string
}

variable "size" {
  type = string
}

variable "admin_user_name" {
  type = string
}

variable "public_key_path" {
  type = string
}

variable "os_disk_caching" {
  type = string
}

variable "os_disk_type" {
  type = string
}

variable "storage_account_name" {

  type = string
}

variable "extension_name1" {
  type = string
}

variable "extension1_publisher" {
  type = string
}

variable "extension1_type" {
  type = string
}

variable "extension1_type_handler_version" {
  type = string
}

variable "extension_name2" {
  type = string
}

variable "extension2_publisher" {
  type = string
}

variable "extension2_type" {
  type = string
}

variable "extension2_type_handler_version" {
  type = string
}

variable "os_publisher" {
  type = string
}
variable "os_offer" {
  type = string
}

variable "os_sku" {
  type = string
}
variable "os_version" {
  type = string
}

variable "availibility_set" {
  type = string
}
variable "private_key" {
  type = string
}
variable "boot_diagnostics_storage_account_uri"{
type=string
}
