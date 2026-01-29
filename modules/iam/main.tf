data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "rg" {
  name     = "rg-${var.env}-iam"
  location = var.location
  tags     = var.tags
}

# User-assigned identity intended for CI/CD (GitHub Actions/Azure DevOps) or platform automation.
resource "azurerm_user_assigned_identity" "platform" {
  name                = "uai-${var.env}-platform"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  tags                = var.tags
}

# Optional: grant Contributor at this IAM RG to specified principals (keep scope tight by default).
resource "azurerm_role_assignment" "platform_admin_rg_contributor" {
  for_each = toset(var.platform_admin_principal_ids)

  scope                = azurerm_resource_group.rg.id
  role_definition_name = "Contributor"
  principal_id         = each.value
}

# Give the platform UAI rights to manage this env's resources if you want automation to be able to operate.
# This is intentionally scoped to RG; widen scope only when necessary.
resource "azurerm_role_assignment" "uai_rg_contributor" {
  scope                = azurerm_resource_group.rg.id
  role_definition_name = "Contributor"
  principal_id         = azurerm_user_assigned_identity.platform.principal_id
}
