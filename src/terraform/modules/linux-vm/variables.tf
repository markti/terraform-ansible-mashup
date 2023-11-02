variable "hostname" {
  type = string
}
variable "resource_group_name" {
  description = "The name of the resource group in which to create the virtual network."
}

variable "location" {
  description = "The location/region where the virtual network is created. Changing this forces a new resource to be created."
}
variable "vm_size" {
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
variable "data_disks" {
  type = object({
    count   = number
    caching = string
    size    = number
  })
}
variable "log_disks" {
  type = object({
    count   = number
    caching = string
    size    = number
  })
}
variable "os_disk" {
  type = object({
    caching = string
    size    = number
  })
}
variable "storage_account_type" {
  type = string
}
variable "managed_id" {
  type = string
}
variable "subnet_id" {
  type = string
}
variable "boot_diagnostics_storage_uri" {
  type = string
}
variable "fault_domain" {
  type    = number
  default = -1
}
variable "zone" {
  type    = number
  default = null
}
variable "proximity_placement_group_id" {
  type    = string
  default = null
}
variable "tags" {
  type    = map(any)
  default = {}
}
variable "dns" {
  type = object({
    name           = string
    resource_group = string
  })
}