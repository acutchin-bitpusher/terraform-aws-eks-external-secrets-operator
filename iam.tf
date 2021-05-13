# Policy
data "aws_iam_policy_document" "external-secrets" {

  statement {
    actions = [
      "secretsmanager:GetResourcePolicy",
      "secretsmanager:GetSecretValue",
      "secretsmanager:DescribeSecret",
      "secretsmanager:ListSecretVersionIds"
    ]
    resources = [
      "*",
    ]
    effect = "Allow"
  }

  statement {
    actions = [
      "ssm:GetParameter"
    ]
    resources = [
      "*",
    ]
    effect = "Allow"
  }

}

resource "aws_iam_policy" "external-secrets" {
  depends_on  = [var.mod_dependency]
  name        = "${var.cluster_name}-external-secrets"
  path        = "/"
  description = "Policy for external secrets service"

  policy = data.aws_iam_policy_document.external-secrets.json
}

# Role
data "aws_iam_policy_document" "external-secrets_assume" {

  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]

    principals {
      type        = "Federated"
      identifiers = [var.cluster_identity_oidc_issuer_arn]
    }

    condition {
      test     = "StringEquals"
      variable = "${replace(var.cluster_identity_oidc_issuer, "https://", "")}:sub"

      values = [
        "system:serviceaccount:eso:external-secrets",
      ]
    }

    effect = "Allow"
  }
}

resource "aws_iam_role" "external-secrets" {
  name               = "${var.cluster_name}-external-secrets"
  assume_role_policy = data.aws_iam_policy_document.external-secrets_assume.json
}

resource "aws_iam_role_policy_attachment" "external-secrets" {
  role       = aws_iam_role.external-secrets.name
  policy_arn = aws_iam_policy.external-secrets.arn
}
