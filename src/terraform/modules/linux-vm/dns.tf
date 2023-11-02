resource "azurerm_private_dns_a_record" "main" {

  name                = var.hostname
  resource_group_name = var.dns.resource_group
  zone_name           = var.dns.name
  ttl                 = 300
  records             = [azurerm_linux_virtual_machine.main.private_ip_address]

}