output "ansible_inventory" {
  value = yamlencode(local.ansible_inventory)
}
output "ansible_variables" {
  value = yamlencode(local.ansible_variables)
}