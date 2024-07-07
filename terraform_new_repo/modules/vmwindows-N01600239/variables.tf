variable "rg_group_name" {
type=string
}
variable "availability_set"{
type=string
}
variable "rg_group_location"{
type =string
}

variable "subnet_id"{
type=string
}


variable "admin_user_name" {
  type    = string
}

variable "os_disk_type" {

  type        = string
}
variable "os_disk_caching" {
  type        = string

}
variable "os_publisher" {
  type        = string
}

variable "os_offer" {
  type        = string
}

variable "os_sku" {
  type        = string
}

variable "os_version" {
  type        = string
  default     = "latest"
}

variable "windows_name"{
 type =  string
}

variable "size" {
type=string
}

variable "platform_fault_domain_count" {
type =string
}
variable "update_domain_count"{
type=string
}

variable "extension_name1"{
type =string
}

variable "extension1_publisher"{
type =string
}

variable "extension1_type"{
type =string
}

variable "extension1_type_handler_version"{
type=string
}
variable "resource_tags"{
type=map(string)
}
variable "domain_name_label_prefix" {
  description = "Prefix for DNS label"
  type        = string
}
