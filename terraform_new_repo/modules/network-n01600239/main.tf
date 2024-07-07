resource "azurerm_virtual_network" "Terraform-Resources-vnet" {
  name                = var.virtual_network_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = [var.virtual_address_space1][0]
  tags                = var.resource_tags
}


resource "azurerm_subnet" "Terraform-Resources-Subnet" {
  name                 = var.subnet1_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.Terraform-Resources-vnet.name
  address_prefixes     = [var.subnet1_address_space][0]
}


resource "azurerm_network_security_group" "Terraform_Security_Group" {
  name                = var.network_security_group1_name
  location            = var.location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "rule1"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "rule2"
    priority                   = 400
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "rule3"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "rule4"
    priority                   = 300
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "5985"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  tags       = var.resource_tags
}

resource "azurerm_subnet_network_security_group_association" "security_network_assoc" {
  subnet_id                 = azurerm_subnet.Terraform-Resources-Subnet.id
  network_security_group_id = azurerm_network_security_group.Terraform_Security_Group.id
}
