output "fault_domain_count" {
  value = local.fault_domain_count[var.location]
}
output "zone_list" {
  value = local.zone_list[var.location]
}
output "zone_count" {
  value = length(local.zone_list[var.location])
}