output "resource_group_name" {
  value = azurerm_resource_group.main.name
}
output "gallery_name" {
  value = azurerm_shared_image_gallery.main.name
}