
locals {
  # https://github.com/MicrosoftDocs/azure-docs/blob/main/includes/managed-disks-common-fault-domain-region-list.md
  # map to help us lookup how many fault domains in a particular region
  fault_domain_count = {
    "centraluseuap"  = 1
    "eastus"         = 3
    "eastus2"        = 3
    "eastus2euap"    = 2
    "southcentralus" = 3
    "westcentralus"  = 2
    "westus"         = 3
    "westus2"        = 3
    "westus3"        = 3
  }
  zone_list = {
    "eastus2euap"    = [1, 2, 3]
    "eastus2"        = [1, 2, 3]
    "eastus"         = [1, 2, 3]
    "westus"         = [1, 2, 3]
    "westus2"        = [1, 2, 3]
    "westus3"        = [1, 2, 3]
    "southcentralus" = [1, 2, 3]
  }
}