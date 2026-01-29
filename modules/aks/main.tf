resource "azurerm_resource_group" "rg" {
  name     = "rg-${var.env}-compute"
  location = var.location
  tags     = var.tags
}

resource "azurerm_kubernetes_cluster" "this" {
  name                = "aks-${var.env}"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "aks-${var.env}"

  kubernetes_version = var.kubernetes_version

  # Prefer UAI for predictable identity and tighter RBAC patterns; fallback to system-assigned if not provided.
  dynamic "identity" {
    for_each = var.user_assigned_identity_id == null ? [1] : []
    content {
      type = "SystemAssigned"
    }
  }

  dynamic "identity" {
    for_each = var.user_assigned_identity_id != null ? [1] : []
    content {
      type = "UserAssigned"
      identity_ids = [var.user_assigned_identity_id]
    }
  }

  role_based_access_control_enabled = true

  dynamic "azure_active_directory_role_based_access_control" {
    for_each = length(var.admin_group_object_ids) > 0 ? [1] : []
    content {
      admin_group_object_ids = var.admin_group_object_ids
      azure_rbac_enabled     = true
    }
  }

  default_node_pool {
    name                = "system"
    vm_size             = var.system_node_vm_size
    node_count          = var.system_node_count
    vnet_subnet_id      = var.subnet_id
    os_disk_size_gb     = var.system_node_os_disk_gb
    type                = "VirtualMachineScaleSets"

    upgrade_settings {
      max_surge = var.system_node_max_surge
    }
  }

  network_profile {
    network_plugin      = "azure"
    network_plugin_mode = "overlay"
    load_balancer_sku   = "standard"
    outbound_type       = "loadBalancer"
  }

  dynamic "oms_agent" {
    for_each = var.log_analytics_workspace_id != null ? [1] : []
    content {
      log_analytics_workspace_id = var.log_analytics_workspace_id
    }
  }

  tags = var.tags
}

# Optional user node pool
resource "azurerm_kubernetes_cluster_node_pool" "user" {
  count = var.enable_user_pool ? 1 : 0

  name                 = "user"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.this.id
  vm_size              = var.user_node_vm_size
  node_count           = var.user_node_count
  vnet_subnet_id       = var.subnet_id
  mode                 = "User"
  os_disk_size_gb      = var.user_node_os_disk_gb
  tags                 = var.tags
}
