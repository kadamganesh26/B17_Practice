resource "azurerm_linux_virtual_machine" "vm-block" {
  for_each                        = var.child_vm
  name                            = each.value.vm_name
  resource_group_name             = each.value.resource_group_name
  location                        = each.value.location
  size                            = each.value.size
  admin_username                  = each.value.admin_username
  admin_password                  = each.value.admin_password
  network_interface_ids           = [data.azurerm_network_interface.nic-data-block[each.key].id]
  disable_password_authentication = "false"

  os_disk {
    caching              = each.value.caching
    storage_account_type = each.value.storage_account_type
  }
  source_image_reference {
    publisher = each.value.publisher
    offer     = each.value.offer
    sku       = each.value.sku
    version   = each.value.version
  }
}

