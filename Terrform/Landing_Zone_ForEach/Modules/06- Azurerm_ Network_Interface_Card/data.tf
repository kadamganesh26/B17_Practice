data "azurerm_subnet" "subnet-data-blk" {
  for_each = var.child_nic
  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}