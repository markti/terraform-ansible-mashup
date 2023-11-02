resource "azurerm_user_assigned_identity" "main" {
  location            = var.location
  resource_group_name = var.resource_group_name
  name                = "mi-${var.prefix}-${var.name}"
}