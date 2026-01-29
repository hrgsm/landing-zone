variable "location" {
  type        = string
  description = "Azure region (e.g., brazilsouth, eastus, westeurope)"
  default     = "brazilsouth"
}

variable "tags" {
  type        = map(string)
  description = "Common tags"
  default = {
    managed_by = "terraform"
  }
}

variable "env" {
  type        = string
  description = "Environment name"
}

variable "admin_group_object_ids" {
  type        = list(string)
  description = "AAD group object IDs to be AKS cluster admins"
  default     = []
}

variable "log_analytics_workspace_id" {
  type        = string
  description = "Log Analytics workspace ID to enable Container Insights (optional)"
  default     = null
}
