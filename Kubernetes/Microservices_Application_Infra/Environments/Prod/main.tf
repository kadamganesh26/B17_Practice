#Creates Azure resource group(s)
module "resource_group" {
  source   = "../../Modules/01-Azurerm_Resource_Group"
  child_rg = var.prod_resource_group
}
#	Deploys Azure Container Registry
module "acr" {
  source     = "../../Modules/02-Azurerm Azure_Container_Registry"
  depends_on = [module.resource_group]
  child_acr  = var.prod_acr
}

#	Creates AKS cluster
module "aks" {
  source     = "../../Modules/04-Azurerm_Azure_Kubernetes_Services"
  depends_on = [module.resource_group]
  child_aks  = var.prod_aks
}

#Assigns AcrPull role to AKS kubelet identity to access ACR
module "role" {
  source     = "../../Modules/03-Azurerm_Role_Assignment_Managed_Identity"
  depends_on = [module.acr, module.aks]
  child_acr_pull = var.prod_acr_pull
  

}
