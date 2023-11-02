resource "azurerm_private_dns_zone" "main" {
  name                = var.dns_name
  resource_group_name = azurerm_resource_group.main.name
}
resource "azurerm_private_dns_zone_virtual_network_link" "main" {
  name                  = "${var.application_name}-${var.environment_name}"
  resource_group_name   = azurerm_resource_group.main.name
  private_dns_zone_name = var.dns_name
  virtual_network_id    = azurerm_virtual_network.main.id
  registration_enabled  = false

  depends_on = [azurerm_private_dns_zone.main]
}