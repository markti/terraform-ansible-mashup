application_name   = "tfany"
environment_name   = "dev"
primary_location   = "westus3"
vnet_address_space = "10.37.0.0/22"
vpn_address_space  = "10.38.0.0/24"
dns_name           = "azure-terraformer.com"

vm_image = {
  version = "1.0.0"
  name    = "baseline-ubuntu-2004"
}

vm_image_gallery = {
  name                = "galtfanygaldevt3lhwz"
  resource_group_name = "rg-tfany-gal-dev-t3lhwz"
}