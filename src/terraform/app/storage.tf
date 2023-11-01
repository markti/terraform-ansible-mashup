resource "azurerm_storage_account" "boot_diagnostics" {

  name                     = "stbootdiag${random_string.suffix.result}"
  resource_group_name      = azurerm_resource_group.main.name
  location                 = azurerm_resource_group.main.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

}