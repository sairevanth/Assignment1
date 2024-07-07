variable "resource_group_name" {
  type        = string
  description = "This Block is used for Network resource group naming"
}

variable "resource_group_location" {
  type        = string
  description = "This Block is used for the Resource Group Location Naming"
}

variable "resource_tags" {
  type        = map(string)
  description = "tags for resources"
}
