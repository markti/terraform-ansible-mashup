
module "azure_regions" {
  # This cannot be dynamic as it is special
  source   = "../azure-regions"
  location = var.location
}

resource "azurerm_orchestrated_virtual_machine_scale_set" "main" {

  name                        = "vmss-${var.prefix}-${var.name}"
  location                    = var.location
  resource_group_name         = var.resource_group_name
  platform_fault_domain_count = module.azure_regions.fault_domain_count

}

module "nodes" {

  count = var.node_count

  source = "../linux-vm"

  resource_group_name          = var.resource_group_name
  location                     = var.location
  hostname                     = "vm${var.name}node${count.index}"
  vm_size                      = var.vm_size
  vm_image_id                  = var.vm_image_id
  admin_username               = var.admin_username
  admin_ssh_key                = var.admin_ssh_key
  storage_account_type         = "Premium_LRS"
  managed_id                   = azurerm_user_assigned_identity.main.id
  subnet_id                    = var.subnet_id
  boot_diagnostics_storage_uri = var.boot_diagnostics_storage_uri
  dns = var.dns

  data_disks = {
    caching = "ReadOnly"
    count   = 4
    size    = 1024
  }
  log_disks = {
    caching = "ReadOnly"
    count   = 0
    size    = 1024
  }
  os_disk = {
    caching = "ReadOnly"
    size    = 1024
  }
}