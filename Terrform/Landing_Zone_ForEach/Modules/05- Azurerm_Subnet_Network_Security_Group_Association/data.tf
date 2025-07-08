data "azurerm_subnet" "subnet-data-blk" {
  for_each = var.child_subnet_asso_nsg
  name                 = each.value.subnet-data
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}


data "azurerm_network_security_group" "nsg-data-blk" {
  for_each            = var.child_subnet_asso_nsg
  name                = each.value.name_nsg
  resource_group_name = each.value.resource_group_name
}


