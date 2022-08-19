locals {
  k8s_namespaces = {
    for namespace in var.k8s_namespaces :
    namespace.name => namespace
  }
}

resource "kubernetes_namespace" "k8s_namespace" {
  for_each = local.k8s_namespaces

  metadata {
    name = each.key

    labels      = each.value.labels
    annotations = each.value.annotations
  }
}
