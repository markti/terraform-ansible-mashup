resource "azurerm_key_vault" "main" {
  name                = "kv-${var.name}"
  location            = var.location
  resource_group_name = var.resource_group_name

  enabled_for_disk_encryption = false
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  purge_protection_enabled    = false

  sku_name = "standard"

}

data "azurerm_client_config" "current" {}
