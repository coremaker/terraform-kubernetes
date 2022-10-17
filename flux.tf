resource "kubernetes_namespace" "flux" {
  count = var.flux_enabled ? 1 : 0

  metadata {
    name = "flux"
  }
}

resource "kubernetes_secret" "flux_secret" {
  count = var.flux_enabled ? 1 : 0

  metadata {
    name      = "flux-secret"
    namespace = kubernetes_namespace.flux[0].metadata[0].name
  }

  data = {
    "identity" = var.flux_private_key_pem
  }
}

resource "helm_release" "helm_operator" {
  count = var.flux_enabled ? 1 : 0

  name      = "helm-operator"
  version   = var.helm_operator_chart_version
  namespace = kubernetes_namespace.flux[0].metadata[0].name

  chart      = "helm-operator"
  repository = "https://charts.fluxcd.io"

  set {
    name  = "git.ssh.secretName"
    value = kubernetes_secret.flux_secret[0].metadata[0].name
  }

  set {
    name  = "image.tag"
    value = var.helm_operator
  }

  set {
    name  = "helm.versions"
    value = "v3"
  }
}

resource "helm_release" "flux" {
  count = var.flux_enabled ? 1 : 0

  name      = "flux"
  version   = var.flux_chart_version
  namespace = kubernetes_namespace.flux[0].metadata[0].name

  chart      = "flux"
  repository = "https://charts.fluxcd.io"

  set {
    name  = "git.url"
    value = var.flux_git_url
  }

  set {
    name  = "git.path"
    value = var.flux_git_path
  }

  set {
    name  = "git.secretName"
    value = kubernetes_secret.flux_secret[0].metadata[0].name
  }

  set {
    name  = "rbac.create"
    value = "true"
  }

  set {
    name  = "image.tag"
    value = var.flux_version
  }

  set {
    name  = "manifestGeneration"
    value = var.flux_manifest_generation
  }
}
