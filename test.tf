resource "kubernetes_secret" "test" {  
  metadata {
    name      = "test-secret"
    namespace = "coremaker"
  }

  data = {
    "test" = "test"
  }
}