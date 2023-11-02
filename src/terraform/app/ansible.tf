locals {

  all_clusters = [module.primary_cluster]

  nodes_array = flatten(
    [
      for cluster in local.all_clusters :
      [
        for node in cluster.nodes :
        {
          hostname           = "${node.hostname}.${var.dns_name}"
          private_ip_address = node.private_ip_address
          datacenter         = lower(cluster.name)
          rack               = "rack${node.fault_domain}"
          replication_factor = cluster.fault_domain_count
        }
      ]
    ]
  )

  nodes_block = {
    for node in local.nodes_array :
    node.private_ip_address => {
      datacenter         = node.datacenter
      rack               = node.rack
      replication_factor = node.replication_factor
    }
  }

  ansible_inventory = {
    all = {
      children = {
        cluster = {
          hosts = local.nodes_block
        }
      }
    }
  }

  ansible_variables = {
    managed_id = module.primary_cluster.managed_id.client_id
  }

}

resource "local_file" "ansible_inventory" {
  content  = yamlencode(local.ansible_inventory)
  filename = "${path.module}/inventory.yml"
}

resource "local_file" "ansible_vars" {
  content  = yamlencode(local.ansible_variables)
  filename = "${path.module}/vars.yml"
}