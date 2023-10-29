locals {
  publisher_name = "azure-terraformer"
}

resource "azurerm_shared_image" "baseline_ubuntu2004" {
  name                = "baseline-ubuntu-2004"
  gallery_name        = azurerm_shared_image_gallery.main.name
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  os_type             = "Linux"

  identifier {
    publisher = local.publisher_name
    offer     = "baseline"
    sku       = "ubuntu-20.04"
  }
}