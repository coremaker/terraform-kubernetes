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

    labels = {
      "${each.value["label_name"]}" = each.value["label_value"]
    }

    // labels = {
    //   mylabel = "label-value"
    // }
  }
}