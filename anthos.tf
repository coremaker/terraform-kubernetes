resource "kubernetes_namespace" "anthos" {
  count = var.anthos_enabled ? 1 : 0

  metadata {
    name = var.anthos_namespace
  }
}

resource "helm_release" "anthos_cpr" {
  count = var.anthos_enabled ? 1 : 0

  name      = var.anthos_cpr_name
  chart     = format("%s/helm-charts/anthos_cpr", path.module)
  namespace = kubernetes_namespace.anthos.0.metadata.0.name

  set {
    name  = "name"
    value = var.anthos_cpr_name
  }

  set {
    name  = "vpcsc.enabled"
    value = var.anthos_vpcsc_enabled
  }

  set {
    name  = "cni.enabled"
    value = var.anthos_cni_enabled
  }

  set {
    name  = "type"
    value = var.anthos_service_type
  }

  set {
    name  = "channel"
    value = var.anthos_channel
  }

  depends_on = [kubernetes_namespace.anthos]
}

resource "helm_release" "istio_ingressgateway" {
    count = var.ingressgateway_enabled ? 1 : 0

  name      = var.ingressgateway_name
  version   = var.ingressgateway_version
  namespace = var.istio_gateways_namespace

  chart      = "gateway"
  repository = "https://istio-release.storage.googleapis.com/charts"

  dynamic "set" {
    for_each = var.ingressgateway_values["values"]
    content {
      name = set.value.name
      value = set.value.value
    }
  }

  // set {
  //   name  = "labels"
  //   value = var.ingressgateway_values["labels"]
  // }

  // set {
  //   name  = "annotations"
  //   value = var.ingressgateway_values["annotations"]
  // }
}

resource "helm_release" "istio_egressgateway" {
    count = var.egressgateway_enabled ? 1 : 0

  name      = var.egressgateway_name
  version   = var.egressgateway_version
  namespace = var.istio_gateways_namespace

  chart      = "gateway"
  repository = "https://istio-release.storage.googleapis.com/charts"

  dynamic "set" {
    for_each = var.egressgateway_values
    content {
      name = set.value.name
      value = set.value.value
    }
  }
}