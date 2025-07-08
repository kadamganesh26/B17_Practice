resource "azurerm_mssql_database" "mssql-db-blk" {
  for_each     = var.child_SQL_DB
  name         = each.value.sql-db-name
  server_id    = data.azurerm_mssql_server.MSSQL-DB-Data-blk[each.key].id
  collation    = each.value.collation
  license_type = each.value.license_type
  max_size_gb  = 2
  sku_name     = "S0"
  enclave_type = "VBS"

}





  
