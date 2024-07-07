variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "virtual_network_name" {
  type = string
}
variable "virtual_address_space1" {
  type = list(any)
}


variable "subnet1_name" {
  type = string
}
variable "subnet1_address_space" {
  type = list(any)
}

variable "network_security_group1_name" {
  type = string
}

variable "resource_tags" {
  type = map(string)
}
