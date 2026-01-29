module "network" {
  source = "../../../modules/network"

  env      = var.env
  location = var.location

  # Adjust CIDRs per environment
  vnet_cidr       = var.vnet_cidr
  aks_subnet_cidr = var.aks_subnet_cidr

  tags = var.tags
}
