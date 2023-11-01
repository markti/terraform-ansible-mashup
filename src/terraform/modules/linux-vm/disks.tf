
# Premium/Other Disk
resource "azurerm_managed_disk" "data" {

  count = var.data_disk_count

  name                 = "${local.clean_hostname}-data${count.index}"
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = var.storage_account_type
  create_option        = "Empty"
  disk_size_gb         = var.data_disk_size
}

resource "azurerm_virtual_machine_data_disk_attachment" "data" {

  count = var.data_disk_count

  managed_disk_id    = azurerm_managed_disk.data[count.index].id
  virtual_machine_id = azurerm_linux_virtual_machine.main.id
  lun                = count.index + 10
  caching            = var.data_disk_caching
}

resource "azurerm_managed_disk" "log" {

  count = var.log_disk_count

  name                 = "${local.clean_hostname}-log${count.index}"
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = var.storage_account_type
  create_option        = "Empty"
  disk_size_gb         = var.log_disk_size

}

resource "azurerm_virtual_machine_data_disk_attachment" "log" {

  count = var.log_disk_count

  managed_disk_id    = azurerm_managed_disk.log[count.index].id
  virtual_machine_id = azurerm_linux_virtual_machine.main.id
  lun                = count.index + 20
  caching            = var.log_disk_caching

}
