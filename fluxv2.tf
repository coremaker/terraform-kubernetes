resource "kubernetes_namespace" "fluxv2" {
  count = var.fluxv2_enabled ? 1 : 0

  metadata {
    name = "flux-system"
  }
}

resource "helm_release" "fluxv2_controllers" {
  count = var.fluxv2_enabled ? 1 : 0

  name       = "flux2-controllers"
  repository = var.fluxv2_chart
  chart      = "flux2"
  version    = var.fluxv2_chart_version
  namespace  = kubernetes_namespace.fluxv2[0].metadata[0].name

  set {
    name  = "helmController.create"
    value = "true"
  }

  set {
    name  = "imageAutomationController.create"
    value = var.fluxv2_image_automation_controller_enabled
  }

  set {
    name  = "kustomizeController.create"
    value = "true"
  }

  set {
    name  = "notificationController.create"
    value = var.fluxv2_notification_controller_enabled
  }

  set {
    name  = "sourceController.create"
    value = "true"
  }

  set {
    name  = "imageReflectionController.create"
    value = var.fluxv2_image_reflection_controller_enabled
  }

  dynamic "set" {
    for_each = var.fluxv2_controllers_values
    content {
      name  = set.value.name
      value = set.value.value
    }
  }
}

resource "kubernetes_secret" "fluxv2_github_secret" {
  count = var.fluxv2_enabled ? 1 : 0

  metadata {
    name      = "fluxv2-github-credentials"
    namespace = kubernetes_namespace.fluxv2[0].metadata[0].name
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
  namespace = kubernetes_namespace.fluxv2[0].metadata[0].name
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
    value = var.fluxv2_image_automation_checkout_branch
  }

  set {
    name  = "imageAutomation.pushBranch"
    value = var.fluxv2_image_automation_push_branch
  }

  set {
    name  = "common.resourcesName"
    value = var.fluxv2_resources_name
  }

  set {
    name  = "gitRepository.secretName"
    value = kubernetes_secret.fluxv2_github_secret[0].metadata[0].name
  }

  set {
    name  = "gitRepository.interval"
    value = var.fluxv2_git_repository_interval
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
    value = var.fluxv2_image_automation_interval
  }

  set {
    name  = "imageAutomation.suspend"
    value = var.fluxv2_image_automation_suspend
  }

  depends_on = [helm_release.fluxv2_controllers, kubernetes_secret.fluxv2_github_secret]
}

resource "kubernetes_secret" "fluxv2_gcr_secret" {
  count = var.fluxv2_enabled ? 1 : 0
  type  = "kubernetes.io/dockerconfigjson"
  metadata {
    name      = "fluxv2-gcr-credentials"
    namespace = kubernetes_namespace.fluxv2[0].metadata[0].name
  }

  data = {
    ".dockerconfigjson" = var.fluxv2_gcr_dockerconfig
  }
}