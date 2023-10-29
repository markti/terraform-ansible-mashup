variable subscription_id {
  type = string
}
variable tenant_id {
  type = string
}
variable client_id {
  type = string
}
variable client_secret {
  sensitive = true
  type      = string
}
variable location {
  type = string
}
variable image_name {
  type = string
}
variable image_version {
  type = string
}
variable gallery_name {
  type = string
}
variable gallery_resource_group {
  type = string
}
variable agent_ipaddress {
  type = string
}
variable vm_size {
  type = string
}