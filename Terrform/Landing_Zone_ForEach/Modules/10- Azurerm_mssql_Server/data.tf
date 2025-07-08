data "azuread_user" "data-azuread-user" {
  for_each = var.child_SQL_server
  user_principal_name = each.value.user_principal_name
  
}