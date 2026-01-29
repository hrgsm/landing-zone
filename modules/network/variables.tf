variable "env" {
  type        = string
  description = "Environment name (e.g., nonprod, prod)"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "vnet_cidr" {
  type        = string
  description = "VNet CIDR block"
}

variable "aks_subnet_cidr" {
  type        = string
  description = "Subnet CIDR used by AKS nodes"
}

variable "tags" {
  type        = map(string)
  description = "Tags applied to resources"
  default     = {}
}
