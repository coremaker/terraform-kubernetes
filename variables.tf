variable "k8s_namespaces" {
    type    = list(object({
        name = string
        has_public_ip = bool
        dns_records = set(string)
  }))
}

variable "google_project_id" {
  type = string
  default = ""
}

# CERT-MANAGER

variable "cert_manager_helm_version" {
  default = "v1.2.0"
}

variable "cert_manager_enabled" {
  type = bool
  default = true
}

variable "cert_manager_service_key" {
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