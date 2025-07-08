resource "azurerm_key_vault" "key_vault_blk" {
  for_each                    = var.child_key_vault
  name                        = "${each.value.key_vault_name}-${random_id.key_vault_suffix[each.key].hex}"
  location                    = each.value.location
  resource_group_name         = each.value.resource_group_name
  enabled_for_disk_encryption = each.value.enabled_for_disk_encryption
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = each.value.soft_delete_retention_days
  purge_protection_enabled    = each.value.purge_protection_enabled
  sku_name                    = each.value.sku_name
  enable_rbac_authorization   = each.value.enable_rbac_authorization

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get",
    ]

    storage_permissions = [
      "Get",
    ]
  }
}
# #Key Vault officer role
# resource "azurerm_role_assignment" "kv-officer" {
#   for_each = var.child_key_vault
#   scope = azurerm_key_vault.key_vault_blk[each.key].id
#   role_definition_name = each.value.role_definition_name
#   principal_id = data.azuread_user.kv_admin_user[each.key].object_id
# }

# #KeyVault Secret officer role
# resource "azurerm_role_assignment" "key_vault_secrets_officer_blk" {
#   for_each = var.child_key_vault
#   scope = azurerm_key_vault.key_vault_blk[each.key].id
#   role_definition_name = each.value.role_definition_Secrets_name
#   principal_id = data.azuread_user.kv_admin_user[each.key].object_id
# }

#Random keyvault name
resource "random_id" "key_vault_suffix" {
  for_each    = var.child_key_vault
  byte_length = each.value.byte_length
}

