
resource "azurerm_public_ip" "public_ip_address" {
  name                = "PublicIPForLB"
  location            = var.location
  resource_group_name =  var.rg_name
  allocation_method   = "Static"
  sku                 = "Standard"
}


resource "azurerm_lb" "loadbalancer" {
  name                = "LoadBalancer"
  location            = var.location
  resource_group_name =  var.rg_name

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.public_ip_address.id
  }
  sku                 = "Standard"
}

resource "azurerm_lb_backend_address_pool" "backend_pool" {
  loadbalancer_id = azurerm_lb.loadbalancer.id
  name            = "BackEndAddressPool"

depends_on =[azurerm_lb.loadbalancer]
}
resource "azurerm_lb_backend_address_pool_address" "appvm1_address" {
  name                    = "appvm1"
  backend_address_pool_id = azurerm_lb_backend_address_pool.backend_pool.id
  virtual_network_id      = var.virtual_network_address
ip_address              =   var.Machineid1
}
resource "azurerm_lb_backend_address_pool_address" "appvm2_address" {
  name                    = "appvm2"
  backend_address_pool_id = azurerm_lb_backend_address_pool.backend_pool.id
  virtual_network_id      = var.virtual_network_address
ip_address              = var.Machineid2

}
resource "azurerm_lb_backend_address_pool_address" "appvm3_address" {
  name                    = "appvm3"
  backend_address_pool_id = azurerm_lb_backend_address_pool.backend_pool.id
  virtual_network_id      = var.virtual_network_address
  ip_address              = var.Machineid3

}
resource "azurerm_lb_probe" "lb_probe" {
  loadbalancer_id = azurerm_lb.loadbalancer.id
  name            = "probea"
  port            = 22
}
resource "azurerm_lb_rule" "lb_rule" {
  loadbalancer_id                = azurerm_lb.loadbalancer.id
  name                           = "LBRule"
  protocol                       = "Tcp"
  frontend_port                  = 22
  backend_port                   = 22
  frontend_ip_configuration_name = "PublicIPAddress"
}


