
module "azure_regions" {
  # This cannot be dynamic as it is special
  source   = "../modules/azure-regions"
  location = azurerm_resource_group.main.location
}

resource "azurerm_orchestrated_virtual_machine_scale_set" "main" {

  name                        = "vmss-${var.application_name}-${var.environment_name}"
  location                    = azurerm_resource_group.main.location
  resource_group_name         = azurerm_resource_group.main.name
  platform_fault_domain_count = module.azure_regions.fault_domain_count

}
