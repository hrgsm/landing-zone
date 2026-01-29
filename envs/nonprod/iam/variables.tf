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

variable "platform_admin_principal_ids" {
  type        = list(string)
  description = "Object IDs (users/SPs/MSIs) to grant platform admin roles at RG scope"
  default     = []
}
