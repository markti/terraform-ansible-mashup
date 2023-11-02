
locals {
  clean_hostname = lower(var.hostname)
}

resource "azurerm_linux_virtual_machine" "main" {

  name                            = local.clean_hostname
  location                        = var.location
  resource_group_name             = var.resource_group_name
  size                            = var.vm_size
  computer_name                   = local.clean_hostname
  admin_username                  = var.admin_username
  network_interface_ids           = [azurerm_network_interface.main.id]
  zone                            = var.zone
  proximity_placement_group_id    = var.proximity_placement_group_id
  disable_password_authentication = true
  source_image_id                 = var.vm_image_id
  tags                            = var.tags

  admin_ssh_key {
    username   = var.admin_username
    public_key = var.admin_ssh_key
  }

  os_disk {
    name                 = "${local.clean_hostname}-osdisk"
    caching              = var.os_disk.caching
    storage_account_type = var.storage_account_type
    disk_size_gb         = var.os_disk.size
  }

  identity {
    type         = "UserAssigned"
    identity_ids = [var.managed_id]
  }

  boot_diagnostics {
    storage_account_uri = var.boot_diagnostics_storage_uri
  }
}
