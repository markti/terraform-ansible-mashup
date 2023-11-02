output "name" {
  value = var.name
}
output "node_private_ip_addresses" {
  value = module.nodes.*.private_ip_address
}
output "node_fault_domains" {
  value = module.nodes.*.fault_domain
}
output "node_fault_zones" {
  value = module.nodes.*.zone
}
output "nodes" {
  value = [
    for node in module.nodes : {
      hostname           = lower(node.hostname)
      private_ip_address = node.private_ip_address
      region             = node.location
      zone               = node.zone
      fault_domain       = node.fault_domain
    }
  ]
}
output "fault_domain_count" {
  value = module.azure_regions.fault_domain_count
}
output "zone_count" {
  value = module.azure_regions.zone_count
}
output "managed_id" {
  value = azurerm_user_assigned_identity.main
}