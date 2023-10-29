data "azuread_application_published_app_ids" "well_known" {}

locals {
  azure_vpn_application_id = data.azuread_application_published_app_ids.well_known.result["AzureVPN"]
}

resource "azurerm_public_ip" "vpn" {

  name                = "pip-${var.application_name}-${var.environment_name}-${local.suffix}-vpn-gateway"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  allocation_method   = "Dynamic"

}

resource "azurerm_virtual_network_gateway" "vpn" {

  name                = "vpng-${var.application_name}-${var.environment_name}-${local.suffix}"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location

  type     = "Vpn"
  vpn_type = "RouteBased"

  active_active = false
  enable_bgp    = false
  sku           = "VpnGw1"

  ip_configuration {
    name                          = "vnetGatewayConfig"
    public_ip_address_id          = azurerm_public_ip.vpn.id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = azurerm_subnet.gateway.id
  }

  vpn_client_configuration {
    address_space        = [var.vpn_address_space]
    vpn_auth_types       = ["AAD"]
    aad_tenant           = "https://login.microsoftonline.com/${data.azurerm_client_config.current.tenant_id}/"
    aad_audience         = local.azure_vpn_application_id
    aad_issuer           = "https://sts.windows.net/${data.azurerm_client_config.current.tenant_id}/"
    vpn_client_protocols = ["OpenVPN"]
  }
}