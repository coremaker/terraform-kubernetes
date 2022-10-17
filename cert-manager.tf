resource "kubernetes_namespace" "cert_manager" {
  count = var.cert_manager_enabled ? 1 : 0

  metadata {
    name = "cert-manager"
  }
}

resource "kubernetes_secret" "cert_manager_service_key" {
  count = var.cert_manager_enabled ? 1 : 0

  metadata {
    name      = "cert-manager-secrets"
    namespace = kubernetes_namespace.cert_manager[0].metadata[0].name
  }

  data = {
    "cert-manager-service.private-key.json" = var.cert_manager_service_key
  }

  depends_on = [kubernetes_namespace.cert_manager]
}

resource "helm_release" "cert_manager" {
  count = var.cert_manager_enabled ? 1 : 0

  chart      = "cert-manager"
  repository = "https://charts.jetstack.io"
  name       = "cert-manager"

  version   = var.cert_manager_helm_version
  namespace = kubernetes_namespace.cert_manager[0].metadata[0].name
  timeout   = "60"

  set {
    name  = "installCRDs"
    value = "true"
  }

  depends_on = [kubernetes_namespace.cert_manager, kubernetes_secret.cert_manager_service_key]
}

resource "helm_release" "cert_manager_lentsencrypt" {
  count = var.cert_manager_enabled ? 1 : 0

  name      = "cert-managers-letsencrypt"
  chart     = format("%s/helm-charts/cert-manager-letsencrypt", path.module)
  namespace = kubernetes_namespace.cert_manager[0].metadata[0].name

  set {
    name  = "clouddns.projectId"
    value = var.cert_manager_clouddns_project_id
  }

  depends_on = [kubernetes_namespace.cert_manager, helm_release.cert_manager]
}
