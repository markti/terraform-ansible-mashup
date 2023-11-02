
resource "azurerm_virtual_network" "main" {

  name                = "vnet-${var.application_name}-${var.environment_name}-${local.suffix}"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  address_space       = [var.vnet_address_space]

}

resource "azurerm_subnet" "bastion" {

  name = "AzureBastionSubnet"

  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name

  address_prefixes = [cidrsubnet(var.vnet_address_space, 2, 1)]

}

resource "azurerm_subnet" "gateway" {

  name = "GatewaySubnet"

  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name

  address_prefixes = [cidrsubnet(var.vnet_address_space, 2, 2)]

}

resource "azurerm_subnet" "cluster" {

  name = "snet-cluster"

  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name

  address_prefixes = [cidrsubnet(var.vnet_address_space, 2, 3)]

}