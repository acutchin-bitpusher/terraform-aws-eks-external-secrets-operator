resource "kubernetes_namespace" "external-secrets" {
  depends_on = [var.mod_dependency]

  metadata {
    name = "external-secrets"
  }
}
