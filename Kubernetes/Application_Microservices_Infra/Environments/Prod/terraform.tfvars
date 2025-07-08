#Resource Group Configuration
prod_resource_group = {
  rg1 = {
    resource_group_name = "microservices"
    location            = "central india"
  }
}
#Azure Container Registry (ACR) Configuration
prod_acr = {
  acr1 = {
    acr_name                = "microservices07032025"
    resource_group_name     = "microservices"
    location                = "central india"
    sku                     = "Premium"
    admin_enabled           = false
    georeplication1         = "East US"
    zone_redundancy_enabled = true
    georeplication2         = "North Europe"
    length                  = 6
    upper                   = false
    special                 = false
  }
}

#Azure Kubernetes Service (AKS) Configuration
prod_aks = {
  culster1 = {
    aks_name            = "microservicesaks"
    location            = "central india"
    resource_group_name = "microservices"
    node_pool_name      = "default"
    dns_prefix          = "aks1"
    default_node_pool = {
      node_count = 3
      vm_size    = "standard_a2_v2"
      node_name  = "npweb01"
    }
    identity = {
      type = "SystemAssigned"
    }
  }
}

#Role Assignment: AKS → ACR Pull Permission
prod_acr_pull = {
assign1 = {
    cluster_name          = "microservicesaks"
    cluster_rg_name       = "microservices"
    acr_name              = "microservices07032025"
    acr_rg_name           = "microservices"
    role_definition_name  = "AcrPull"
  }
}