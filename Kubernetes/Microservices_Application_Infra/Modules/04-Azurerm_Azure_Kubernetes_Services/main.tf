resource "azurerm_kubernetes_cluster" "clusterp-blk" {
  for_each = var.child_aks

  name                = each.value.aks_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  dns_prefix          = each.value.dns_prefix

  default_node_pool {
    name       = each.value.default_node_pool.node_name
    node_count = each.value.default_node_pool.node_count
    vm_size    = each.value.default_node_pool.vm_size
  }
 
  identity {
    type = each.value.identity.type
  }
  
}


