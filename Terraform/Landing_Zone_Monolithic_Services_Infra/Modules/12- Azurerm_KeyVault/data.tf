data "azurerm_client_config" "current" {}

data "azuread_user" "kv_admin_user" {
  for_each = var.child_key_vault
 user_principal_name = each.value.user_principal_name
}
