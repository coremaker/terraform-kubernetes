variable "k8s_namespaces" {
    type    = list(object({
        name = string
        has_public_ip = bool
        dns_records = set(string)
  }))
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