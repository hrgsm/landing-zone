module "iam" {
  source = "../../../modules/iam"

  env      = var.env
  location = var.location

  # Optional: principals to grant platform-level roles
  platform_admin_principal_ids = var.platform_admin_principal_ids

  tags = var.tags
}
