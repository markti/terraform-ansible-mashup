variable "name" {
  type = string
}
variable "resource_group_name" {
  description = "The name of the resource group in which to create the virtual network."
}
variable "location" {
  description = "The location/region where the virtual network is created. Changing this forces a new resource to be created."
}
variable "readers" {
  type = list(string)
}