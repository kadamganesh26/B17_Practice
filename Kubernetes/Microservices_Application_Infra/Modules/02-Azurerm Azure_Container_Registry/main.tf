
# resource "random_string" "acr_suffix" {
#   for_each = var.child_acr
#   length   = each.value.length
#   upper    = each.value.upper
#   special  = each.value.special
# }



resource "azurerm_container_registry" "acr-blk" {
  for_each            = var.child_acr
  name                     = each.value.acr_name
  resource_group_name      = each.value.resource_group_name
  location                 = each.value.location
  sku                      = each.value.sku
  admin_enabled            = each.value.admin_enabled
  zone_redundancy_enabled  = each.value.zone_redundancy_enabled

  georeplications {
    location                = each.value.georeplication1
    zone_redundancy_enabled = true

  }
  georeplications {
    location                = each.value.georeplication2
    zone_redundancy_enabled = true

  }
  identity {type = "SystemAssigned"}
}

