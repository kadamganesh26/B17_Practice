#Resource Group Variables
variable "prod_resource_group" {
  type = map(any)
}
#ACT Variables
variable "prod_acr" {
  type = map(any)
}

#AKS Variables
variable "prod_aks" {
  type = map(any)
}
#Kublete Identity access role variables
variable "prod_acr_pull" {
  type = map(any)
}
 