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

variable "vnet_cidr" {
  type        = string
  description = "VNet CIDR for this environment"
}

variable "aks_subnet_cidr" {
  type        = string
  description = "AKS subnet CIDR for this environment"
}
