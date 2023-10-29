resource "random_string" "suffix" {
  length  = 6
  special = false
  lower   = true
  upper   = false
}

locals {
  suffix = random_string.suffix.result
}

resource "azurerm_resource_group" "main" {

  name     = "rg-${var.application_name}-${var.environment_name}-${local.suffix}"
  location = var.primary_location

}

data "azurerm_client_config" "current" {}