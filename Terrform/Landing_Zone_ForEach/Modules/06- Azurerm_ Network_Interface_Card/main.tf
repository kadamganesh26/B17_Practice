resource "azurerm_network_interface" "nic_blk" {
for_each = var.child_nic
name = each.value.nic_name
location = each.value.location 
resource_group_name =  each.value.resource_group_name
ip_configuration {
  name = each.value.internal_ip_name
  subnet_id = data.azurerm_subnet.subnet-data-blk[each.key].id
  private_ip_address_allocation = "Dynamic"
}
}