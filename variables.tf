variable "k8s_namespaces" {
    type    = list(object({
        name = string
        has_public_ip = bool
        dns_records = set(string)
  }))
}