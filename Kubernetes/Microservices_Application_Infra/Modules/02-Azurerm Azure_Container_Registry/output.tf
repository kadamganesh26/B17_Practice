output "acr_name" {
  value = {
    for key, acr in azurerm_container_registry.acr-blk: key => acr.name
  }
}

output "acr_ids" {
  value = {
    for key, acr in azurerm_container_registry.acr-blk : key => acr.id
  }
}
