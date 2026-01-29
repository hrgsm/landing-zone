output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "aks_id" {
  value = azurerm_kubernetes_cluster.this.id
}

output "aks_name" {
  value = azurerm_kubernetes_cluster.this.name
}

output "kubelet_identity_object_id" {
  value       = try(azurerm_kubernetes_cluster.this.kubelet_identity[0].object_id, null)
  description = "Object ID for kubelet identity (useful for ACR pull role assignments)"
}
