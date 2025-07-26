data "azurerm_mssql_server" "MSSQL-DB-Data" {
  for_each = var.child_SQL_DB
  name                = each.value.server_id
  resource_group_name = each.value.resource_group_name
    
  }


data "azurerm_mssql_server" "MSSQL-DB-Data-blk" {
    for_each = var.child_SQL_DB
  name                = each.value.server_id 
  resource_group_name = each.value.resource_group_name
}