data "terraform_remote_state" "network" {
  backend = "azurerm"
  config = {
    resource_group_name  = "rg-tfstate"
    storage_account_name = "tfstateplatform"
    container_name       = "${var.env}-network"
    key                  = "terraform.tfstate"
  }
}

data "terraform_remote_state" "iam" {
  backend = "azurerm"
  config = {
    resource_group_name  = "rg-tfstate"
    storage_account_name = "tfstateplatform"
    container_name       = "${var.env}-iam"
    key                  = "terraform.tfstate"
  }
}

module "aks" {
  source = "../../../modules/aks"

  env      = var.env
  location = var.location

  subnet_id = data.terraform_remote_state.network.outputs.aks_subnet_id

  # Optional: AAD/RBAC inputs
  admin_group_object_ids = var.admin_group_object_ids

  # Optional: enable Log Analytics integration (pass a workspace id if you have one)
  log_analytics_workspace_id = var.log_analytics_workspace_id

  # Optional: Use a user-assigned identity created by iam layer
  user_assigned_identity_id = data.terraform_remote_state.iam.outputs.platform_uai_id

  tags = var.tags
}
