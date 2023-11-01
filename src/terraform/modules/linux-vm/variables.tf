
variable "resource_group_name" {
  description = "The name of the resource group in which to create the virtual network."
}

variable "location" {
  description = "The location/region where the virtual network is created. Changing this forces a new resource to be created."
}

variable "hostname" {
  type = string
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
variable "data_disk_count" {
  type = number
}
variable "data_disk_caching" {
  type = string
}
variable "data_disk_size" {
  type = number
}
variable "log_disk_count" {
  type = number
}
variable "log_disk_caching" {
  type    = string
  default = null
}
variable "log_disk_size" {
  type    = number
  default = null
}
variable "os_disk_caching" {
  type = string
}
variable "os_disk_size" {
  type    = number
  default = 128
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
variable "workspaceId" {
  type = string
}
variable "workspaceKey" {
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
  type = string
}
variable "tags" {
  type    = map(any)
  default = {}
}