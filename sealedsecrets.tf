resource "kubernetes_namespace" "sealed_secrets" {
  count      = var.sealed_secrets_enabled ? 1 : 0

  metadata {
    name = "sealed-secrets"
  }
  depends_on = [google_container_cluster.kube, google_container_node_pool.kube_nodes]
}

resource "kubernetes_secret" "sealed_secrets_tls" {
  count      = var.sealed_secrets_enabled ? 1 : 0
  
  type  = "kubernetes.io/tls"

  metadata {
    name      = "sealed-secrets-tls"
    namespace = kubernetes_namespace.sealed_secrets.0.metadata.0.name
    labels = {
      "sealedsecrets.bitnami.com/sealed-secrets-key" = "active"
    }
  }

  data = {
    "tls.crt" = var.sealed_secrets_cert_pem
    "tls.key" = var.sealed_secrets_private_key
  }
}

resource "helm_release" "sealed_secrets" {
  count      = var.sealed_secrets_enabled ? 1 : 0

  name       = "sealed-secrets"
  version    = var.sealed_secrets_chart_version
  namespace  = kubernetes_namespace.sealed_secrets.0.metadata.0.name

  chart      = "sealed-secrets"
  repository = "https://charts.helm.sh/stable"

  set {
    name = "image.repository"
    value = "quay.io/bitnami/sealed-secrets-controller"
  }

  set {
    name = "image.tag"
    value = var.sealed_secrets_version
  }

  set {
    name = "serviceAccount.create"
    value = "true"
  }

  set {
    name = "serviceAccount.name"
    value = "sealed-secrets"
  }

  set {
    name = "secretName"
    value = kubernetes_secret.sealed_secrets_tls.0.metadata.0.name
  }

  set {
    name = "crd.create"
    value = "true"
  }

  set {
    name = "crd.keep"
    value = "true"
  }
}