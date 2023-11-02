data "azurerm_shared_image_version" "node_image" {
  name                = var.vm_image.version
  image_name          = var.vm_image.name
  gallery_name        = var.vm_image_gallery.name
  resource_group_name = var.vm_image_gallery.resource_group_name
}

module "primary_cluster" {

  source = "../modules/cluster"

  prefix                       = "${var.application_name}-${var.environment_name}"
  name                         = "dc0"
  resource_group_name          = azurerm_resource_group.main.name
  location                     = azurerm_resource_group.main.location
  node_count                   = 3
  vm_size                      = "Standard_E8s_v5"
  vm_image_id                  = data.azurerm_shared_image_version.node_image.id
  admin_username               = "admin_user"
  admin_ssh_key                = tls_private_key.ssh.public_key_openssh
  subnet_id                    = azurerm_subnet.cluster.id
  boot_diagnostics_storage_uri = azurerm_storage_account.boot_diagnostics.primary_blob_endpoint

  dns = {
    name           = var.dns_name
    resource_group = azurerm_resource_group.main.name
  }

}