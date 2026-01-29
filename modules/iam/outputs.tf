output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "platform_uai_id" {
  value = azurerm_user_assigned_identity.platform.id
}

output "platform_uai_principal_id" {
  value = azurerm_user_assigned_identity.platform.principal_id
}

output "platform_uai_client_id" {
  value = azurerm_user_assigned_identity.platform.client_id
}
