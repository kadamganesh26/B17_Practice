resource "azurerm_resource_group" "prod-rg" {
    for_each = var.child_rg
  name = each.value.resource_group_name
  location = each.value.location
  
}