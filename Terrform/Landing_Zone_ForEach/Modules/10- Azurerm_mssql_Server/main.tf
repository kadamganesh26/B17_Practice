resource "azurerm_mssql_server" "sql-server-block" {
for_each = var.child_SQL_server
  name                         = each.value.sql_server_name
  resource_group_name          = each.value.resource_group_name
  location                     = each.value.location
  version                      = each.value.version
  administrator_login          = each.value.administrator_login
  administrator_login_password = each.value.administrator_login_password
  minimum_tls_version          = each.value.minimum_tls_version

  azuread_administrator {
    login_username = each.value.login_username
    object_id      = data.azuread_user.data-azuread-user[each.key].object_id
      }
}






