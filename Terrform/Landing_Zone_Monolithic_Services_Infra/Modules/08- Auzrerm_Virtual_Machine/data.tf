data "azurerm_network_interface" "nic-data-block" {
    for_each = var.child_vm
    name = each.value.nic-name
    resource_group_name = each.value.resource_group_name
}
