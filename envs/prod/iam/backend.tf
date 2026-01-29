terraform {
  backend "azurerm" {
    resource_group_name  = "rg-tfstate"
    storage_account_name = "tfstateplatform"
    container_name       = "prod-iam"
    key                  = "terraform.tfstate"
  }
}
