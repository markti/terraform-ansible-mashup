module "primary" {

  source = "../modules/cluster"

  name                = "${var.application_name}-${var.environment_name}"
  resource_group_name = azurerm_resource_group.main.name
  location            = var.primary_location

}