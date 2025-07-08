#Fetch ASK Cluster Information
data "azurerm_kubernetes_cluster" "cluster_Data_blk" {
  for_each = var.child_acr_pull

  name                = each.value.cluster_name
  resource_group_name = each.value.cluster_rg_name
}
#FetchACR Informations
data "azurerm_container_registry" "acr" {
  for_each = var.child_acr_pull
  name                = each.value.acr_name
  resource_group_name = each.value.acr_rg_name
}

#Create Rule Assignment : Allow AKS node pool to pull from ACR
resource "azurerm_role_assignment" "aks_acr_pull_blk" {
  for_each             = var.child_acr_pull
  scope                = data.azurerm_container_registry.acr[each.key].id
  role_definition_name = each.value.role_definition_name
  principal_id         =data.azurerm_kubernetes_cluster.cluster_Data_blk[each.key].kubelet_identity[0].object_id
} 