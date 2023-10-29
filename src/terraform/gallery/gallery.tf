locals {
  gallery_name = replace("gal${var.application_name}${var.environment_name}${local.suffix}", "-", "")
}

resource "azurerm_shared_image_gallery" "main" {

  name                = local.gallery_name
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  description         = "Shared Images"

}