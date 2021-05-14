##  https://github.com/external-secrets/external-secrets/tree/deploy/charts/external-secrets
resource "helm_release" "external-secrets" {

  depends_on = [var.mod_dependency, kubernetes_namespace.external-secrets]

  name       = "external-secrets"
  chart      = "external-secrets"
  repository = "https://charts.external-secrets.io/"
  #version    = var.helm_chart_version
  version    = "0.1.1"

  ##  TEMPORARILY HOSTED HELM CHART WITH THE KubeVersion UPDATE 
  ##  https://github.com/external-secrets/external-secrets/commit/bac338ed742b402c7debc988f519519c6159d385
#  name       = "external-secrets"
#  chart      = "external-secrets"
#  repository = "https://bplab-acutchin-usw2-helm.s3-us-west-2.amazonaws.com/charts/"
#  version    = "0.1.1"

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
