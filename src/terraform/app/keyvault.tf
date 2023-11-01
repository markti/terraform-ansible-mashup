module "keyvault" {

  source = "../modules/keyvault"

  name                = "${var.application_name}-${var.environment_name}"
  resource_group_name = azurerm_resource_group.main.name
  location            = var.primary_location
  readers             = []

}