variable "env" {
  type        = string
  description = "Environment name"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID where AKS node pools will be placed"
}

variable "kubernetes_version" {
  type        = string
  description = "AKS Kubernetes version (e.g., 1.29.7). Set null to let Azure choose."
  default     = null
}

variable "admin_group_object_ids" {
  type        = list(string)
  description = "AAD group object IDs to be cluster admins (enables AAD RBAC block when provided)"
  default     = []
}

variable "log_analytics_workspace_id" {
  type        = string
  description = "Log Analytics workspace ID (enables oms_agent when provided)"
  default     = null
}

variable "user_assigned_identity_id" {
  type        = string
  description = "Optional user-assigned identity id for AKS control plane identity"
  default     = null
}

# System node pool settings
variable "system_node_vm_size" {
  type        = string
  default     = "Standard_D4s_v5"
}

variable "system_node_count" {
  type        = number
  default     = 2
}

variable "system_node_os_disk_gb" {
  type        = number
  default     = 80
}

variable "system_node_max_surge" {
  type        = string
  default     = "33%"
}

# Optional user node pool
variable "enable_user_pool" {
  type        = bool
  default     = true
}

variable "user_node_vm_size" {
  type        = string
  default     = "Standard_D4s_v5"
}

variable "user_node_count" {
  type        = number
  default     = 2
}

variable "user_node_os_disk_gb" {
  type        = number
  default     = 80
}

variable "tags" {
  type        = map(string)
  description = "Tags applied to resources"
  default     = {}
}
