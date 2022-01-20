variable "k8s_namespaces" {
    type    = list(object({
        name = string
        has_public_ip = bool
        dns_records = set(string)
  }))
}

# CERT-MANAGER
variable "cert_manager_enabled" {
  type = bool
  default = true
}

variable "cert_manager_service_key" {
  type = string
  default = ""
}

variable "cert_manager_helm_version" {
  default = "v1.2.0"
}

variable "cert_manager_clouddns_projectId" {
  type = string
  default = ""
}

# FLUXV2
variable "fluxv2_enabled" {
    type = bool
    default = false
}

variable "fluxv2_gcr_service_key" {
  type = string
  default = ""
}

variable "fluxv2_private_key_pem" {}
variable "fluxv2_public_key_pem" {}

variable "fluxv2_chart" {
    type = string
    default = "https://github.com/coremaker/helm-chart-fluxv2/releases/download/v0.0.9/fluxv2-0.0.9.tgz"
}

variable "fluxv2_git_url" {
    type = string
    default = ""
}

variable "fluxv2_git_branch" {
    type = string
    default = "main"
}

variable "fluxv2_git_path" {
    type = string
    default = ""
}

variable "fluxv2_resources_name" {
    type = string
    default = "k8s-repo"
}

variable "fluxv2_gitRepository_interval" {
    type = string
    default = "5m"
}

variable "fluxv2_kustomization_prune" {
    type = bool
    default = true
}

variable "fluxv2_kustomization_interval" {
    type = string
    default = "5m"
}

variable "fluxv2_imageAutomation_interval" {
    type = string
    default = "5m"
}

variable "fluxv2_imageAutomation_suspend" {
    type = bool
    default = false
}

variable "fluxv2_imageAutomation_checkout_branch" {
    type = string
    default = "main"
}

variable "fluxv2_imageAutomation_push_branch" {
    type = string
    default = "main"
}

# FLUX
variable "flux_enabled" {
    type = bool
    default = false
}

variable "flux_private_key_pem" {
  type = string
  default = ""
}

variable "flux_git_url" {
    type = string
    default = ""
}

variable "flux_git_path" {
    type = string
    default = "environments/dev"
}

variable "flux_chart_version" {
    default = "1.6.0"
}

variable "flux_version" {
    default = "1.21.0"
}

variable "flux_manifest_generation" {
    type = bool
    default = true
}

variable "helm_operator_chart_version" {
    default = "1.2.0"
}

variable "helm_operator" {
    default = "1.2.0"
}

# Sealed Secrets
variable "sealed_secrets_enabled" {
    type = bool
    default = true
}

variable "sealed_secrets_chart_version" {
    default = "1.12.1"
}

variable "sealed_secrets_version" {
    default = "v0.13.1"
}

variable "sealed_secrets_cert_pem" { 
  type = string
  default = ""
}

variable "sealed_secrets_private_key" { 
  type = string
  default = ""
}