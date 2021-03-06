resource "kubernetes_namespace" "fluxv2" {
  count = var.fluxv2_enabled ? 1 : 0

  metadata {
    name = "flux-system"
  }
}

resource "helm_release" "fluxv2_controllers" {
  count = var.fluxv2_enabled ? 1 : 0

  name      = "fluxv2-controllers"
  namespace = kubernetes_namespace.fluxv2.0.metadata.0.name
  chart     = var.fluxv2_chart

  depends_on = [kubernetes_namespace.fluxv2]
}

resource "kubernetes_secret" "fluxv2_github_secret" {
  count = var.fluxv2_enabled ? 1 : 0

  metadata {
    name      = "fluxv2-github-credentials"
    namespace = kubernetes_namespace.fluxv2.0.metadata.0.name
  }

  data = {
    "identity"     = var.fluxv2_private_key_pem
    "identity.pub" = var.fluxv2_public_key_pem
    "known_hosts"  = file("${path.module}/resources/github-known-hosts")
  }
}

resource "helm_release" "fluxv2" {
  count = var.fluxv2_enabled ? 1 : 0

  name      = "fluxv2"
  namespace = kubernetes_namespace.fluxv2.0.metadata.0.name
  chart     = format("%s/helm-charts/fluxv2", path.module)

  set {
    name  = "gitRepository.url"
    value = var.fluxv2_git_url
  }

  set {
    name  = "common.path"
    value = var.fluxv2_git_path
  }

  set {
    name  = "gitRepository.branch"
    value = var.fluxv2_git_branch
  }

  set {
    name  = "imageAutomation.checkoutBranch"
    value = var.fluxv2_imageAutomation_checkout_branch
  }

  set {
    name  = "imageAutomation.pushBranch"
    value = var.fluxv2_imageAutomation_push_branch
  }

  set {
    name  = "common.resourcesName"
    value = var.fluxv2_resources_name
  }

  set {
    name  = "gitRepository.secretName"
    value = kubernetes_secret.fluxv2_github_secret.0.metadata.0.name
  }

  set {
    name  = "gitRepository.interval"
    value = var.fluxv2_gitRepository_interval
  }

  set {
    name  = "kustomization.prune"
    value = var.fluxv2_kustomization_prune
  }

  set {
    name  = "kustomization.interval"
    value = var.fluxv2_kustomization_interval
  }

  set {
    name  = "imageAutomation.interval"
    value = var.fluxv2_imageAutomation_interval
  }

  set {
    name  = "imageAutomation.suspend"
    value = var.fluxv2_imageAutomation_suspend
  }

  depends_on = [helm_release.fluxv2_controllers, kubernetes_secret.fluxv2_github_secret]
}

resource "kubernetes_secret" "fluxv2_gcr_secret" {
  count = var.fluxv2_enabled ? 1 : 0
  type  = "kubernetes.io/dockerconfigjson"

  metadata {
    name      = "fluxv2-gcr-credentials"
    namespace = kubernetes_namespace.fluxv2.0.metadata.0.name
  }

  data = {
    ".dockerconfigjson" = jsonencode({
      auths = {
        "eu.gcr.io" = {
          username = "_json_key",
          password = var.fluxv2_gcr_service_key
        }
      }
    })
  }
}