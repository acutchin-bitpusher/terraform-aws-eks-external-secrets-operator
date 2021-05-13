##  https://github.com/external-secrets/external-secrets/tree/v0.1.2/deploy/charts/external-secrets
resource "helm_release" "external-secrets" {

  depends_on = [var.mod_dependency, kubernetes_namespace.external-secrets]

  name       = "external-secrets"
  chart      = "external-secrets"
  repository = "https://charts.external-secrets.io/"
  version    = var.helm_chart_version
  namespace  = "external-secrets"

  ##  The name of the service account to use. If not set and create is true, a name is generated using the fullname template.
  set {
    name  = "serviceAccount.name"
    value = "external-secrets"
  }

  dynamic "set" {
    for_each = var.settings

    content {
      name  = set.key
      value = set.value
    }
  }

}
