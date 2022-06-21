variable "k8s_namespaces" {
  type = list(object({
    name          = string
    has_public_ip = bool
    dns_records   = set(string)
  }))
  description = "Namespaces to be created."
}

# CERT-MANAGER
variable "cert_manager_enabled" {
  type    = bool
  default = true
  description = "Enable/Disable cert-manager operator."
}

variable "cert_manager_service_key" {
  type    = string
  default = ""
  description = "Service account key with the right permissions for DNS to be used by cert-manager."
}

variable "cert_manager_helm_version" {
  type    = string
  default = "v1.7.2"
  description = "The helm-chart version to be used."
}

variable "cert_manager_clouddns_projectId" {
  type    = string
  default = ""
  description = "Project id to be used by the cluster issuer."
}

# FLUXV2
variable "fluxv2_enabled" {
  type    = bool
  default = false
  description = "Enable/Disable fluxv2 operator."
}

variable "fluxv2_gcr_service_key" {
  type    = string
  default = ""
  description = "Service account key with the right permissions for GCR to be used by fluxv2."
}

variable "fluxv2_private_key_pem" {
  type = any
  default = ""
  description = "Private key to be used for github integration."
}
variable "fluxv2_public_key_pem" {
  type = any
  default = ""
  description = "Public key to be used for github integration."
}

variable "fluxv2_chart" {
  type    = string
  default = "https://github.com/coremaker/helm-chart-fluxv2/releases/download/v0.0.9/fluxv2-0.0.9.tgz"
  description = "Helm chart to be used to deploy fluxv2."
}

variable "fluxv2_git_url" {
  type    = string
  default = ""
  description = "Github SSH url to the repository holding kubernetes manifests."
}

variable "fluxv2_git_branch" {
  type    = string
  default = "main"
  description = "Github branch to be used."
}

variable "fluxv2_git_path" {
  type    = string
  default = ""
  description = "Github repository path to be used."
}

variable "fluxv2_resources_name" {
  type    = string
  default = "k8s-repo"
  description = "The name of the main fluxv2 resources."
}

variable "fluxv2_gitRepository_interval" {
  type    = string
  default = "5m"
  description = "Fluxv2 gitrepository resource sync interval."
}

variable "fluxv2_kustomization_prune" {
  type    = bool
  default = true
  description = "Enable/Disable prune for all resources."
}

variable "fluxv2_kustomization_interval" {
  type    = string
  default = "5m"
  description = "Fluxv2 kustomization resource sync interval."
}

variable "fluxv2_imageAutomation_interval" {
  type    = string
  default = "5m"
  description = "Fluxv2 image automation resource sync interval."
}

variable "fluxv2_imageAutomation_suspend" {
  type    = bool
  default = false
  description = "Suspend image automation resource."
}

variable "fluxv2_imageAutomation_checkout_branch" {
  type    = string
  default = "main"
  description = "Branch holding the versions to be used for deployments."
}

variable "fluxv2_imageAutomation_push_branch" {
  type    = string
  default = "main"
  description = "Branch where to push new versions for deployments."
}

# FLUX
variable "flux_enabled" {
  type    = bool
  default = false
  description = "Enable/Disable flux operator."
}

variable "flux_private_key_pem" {
  type    = string
  default = ""
  description = "Private key to be used for github integration."
}

variable "flux_git_url" {
  type    = string
  default = ""
  description = "Github SSH url to the repository holding kubernetes manifests."
}

variable "flux_git_path" {
  type    = string
  default = "environments/dev"
  description = "Github repository path to be used."
}

variable "flux_chart_version" {
  type    = string
  default = "1.6.0"
  description = "Helm chart version to deploy."
}

variable "flux_version" {
  type    = string
  default = "1.21.0"
  description = "Application version to deploy."
}

variable "flux_manifest_generation" {
  type    = bool
  default = true
  description = "Enable/Disable manifests."
}

variable "helm_operator_chart_version" {
  type    = string
  default = "1.2.0"
  description = "Helm chart version to deploy."
}

variable "helm_operator" {
  type    = string
  default = "1.2.0"
  description = "Application version do deploy."
}

# Sealed Secrets
variable "sealed_secrets_enabled" {
  type    = bool
  default = true
  description = "Enable/Disable sealed-secrets operator."
}

variable "sealed_secrets_chart_version" {
  type    = string
  default = "1.0.8"
  description = "Helm chart version to deploy."
}

variable "sealed_secrets_version" {
  type    = string
  default = "0.18.0"
  description = "Application version do deploy."
}

variable "sealed_secrets_cert_pem" {
  type    = string
  default = ""
  description = "Self-signed cert to be used for the encryption/decryption of secrets."
}

variable "sealed_secrets_private_key" {
  type    = string
  default = ""
  description = "Private key used for the encryption of secrets."
}