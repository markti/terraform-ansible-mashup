variable "prefix" {
  type = string
}
variable "name" {
  type = string
}
variable "resource_group_name" {
  description = "The name of the resource group in which to create the virtual network."
}
variable "location" {
  description = "The location/region where the virtual network is created. Changing this forces a new resource to be created."
}
variable "node_count" {
  type = number
}
variable vm_size {
  type = string
}
variable "vm_image_id" {
  type = string
}
variable "admin_username" {
  type = string
}
variable "admin_ssh_key" {
  type = string
}
variable "subnet_id" {
  type = string
}
variable "boot_diagnostics_storage_uri" {
  type = string
}
variable "dns" {
  type = object({
    name           = string
    resource_group = string
  })
}