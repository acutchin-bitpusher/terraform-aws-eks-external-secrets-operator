variable "cluster_name" {
  type        = string
  description = "EKS Cluster name"
}

variable "cluster_identity_oidc_issuer" {
  type        = string
}

variable "cluster_identity_oidc_issuer_arn" {
  type        = string
}

variable "helm_chart_version" {
  type        = string
  default     = "0.1.2"
}

variable "settings" {
  type        = map(any)
  default     = {}
}

variable "mod_dependency" {
  default     = null
  description = "Dependence variable binds all AWS resources allocated by this module, dependent modules reference this variable"
}

