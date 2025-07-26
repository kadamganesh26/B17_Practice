resource "azurerm_subnet_network_security_group_association" "nsg-asso" {
  for_each                  = var.child_subnet_asso_nsg
  subnet_id                 = data.azurerm_subnet.subnet-data-blk[each.key].id
  network_security_group_id = data.azurerm_network_security_group.nsg-data-blk[each.key].id
}






