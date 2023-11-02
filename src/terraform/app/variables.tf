variable "application_name" {
  type = string
}
variable "environment_name" {
  type = string
}
variable "primary_location" {
  type = string
}
variable "vnet_address_space" {
  type = string
}
variable "vpn_address_space" {
  type = string
}
variable "vm_image" {
  type = object({
    version = string
    name    = string
  })
}
variable "vm_image_gallery" {
  type = object({
    name                = string
    resource_group_name = string
  })
}
variable "dns_name" {
  type = string
}