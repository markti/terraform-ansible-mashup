
module "azure_regions" {
  # This cannot be dynamic as it is special
  source   = "../modules/azure-regions"
  location = azurerm_resource_group.main.location
}

resource "azurerm_orchestrated_virtual_machine_scale_set" "main" {

  name                        = "vmss-${var.name}"
  location                    = var.location
  resource_group_name         = var.resource_group_name
  platform_fault_domain_count = module.azure_regions.fault_domain_count

}
