variable "env" {
  type        = string
  description = "Environment name"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "platform_admin_principal_ids" {
  type        = list(string)
  description = "Object IDs (users/SPs/MSIs) to grant Contributor at IAM RG scope"
  default     = []
}

variable "tags" {
  type        = map(string)
  description = "Tags applied to resources"
  default     = {}
}
