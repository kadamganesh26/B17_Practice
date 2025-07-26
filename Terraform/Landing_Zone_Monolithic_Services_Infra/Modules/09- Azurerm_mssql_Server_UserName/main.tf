resource "azuread_user" "azureuser_block" {
  for_each              = var.child_azuser
  user_principal_name   = each.value.user_principal_name
  display_name          = each.value.display_name
  password              = each.value.password
  force_password_change = each.value.force_password_change
  mail_nickname         = each.value.mail_nickname
}
