resource "azurerm_resource_group" "stg-rg" {
  name     = "stg-resource-group"
  location = "central india"

}

resource "azurerm_storage_account" "stg-blk" {
  name                     = "stgprod17072025"
  location                 = azurerm_resource_group.stg-rg.location
  resource_group_name      = azurerm_resource_group.stg-rg.name
  account_replication_type = "GRS"
  account_tier             = "Standard"

}

resource "azurerm_storage_share" "share-blk" {
  name                 = "myphotos"
  storage_account_name = azurerm_storage_account.stg-blk.name
  quota                = 50

}

# resource "azurerm_storage_share_file" "sharefile-blk" {
#   name             = "myphotos"
#   storage_share_id = azurerm_storage_share.share-blk.id
# }