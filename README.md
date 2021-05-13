# terraform-aws-eks-external-secrets-operator

Terraform module for deploying [External Secrets Operator](https://github.com/external-secrets/external-secrets) to an AWS/EKS cluster.

## Usage

```
module "external-secrets" {
  source = "git::https://github.com/acutchin-bitpusher/terraform-aws-eks-external-secrets-operator"

  cluster_name                     = module.cluster.eks_cluster_id
  cluster_identity_oidc_issuer     = module.cluster.eks_cluster_identity_oidc_issuer
  cluster_identity_oidc_issuer_arn = module.cluster.eks_cluster_identity_oidc_issuer_arn
  secrets_aws_region               = var.aws.region

}
```

<!--- BEGIN_TF_DOCS --->

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.14, < 0.15 |
| aws | >= 3.39, < 4.0 |
| helm | >= 2.1.2, < 3.0 |
| kubernetes | >= 2.1.0, < 3.0 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 3.39, < 4.0 |
| helm | >= 2.1.2, < 3.0 |
| kubernetes | >= 2.1.0, < 3.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cluster\_name | The name of the cluster | `string` | n/a | yes |
| cluster\_identity\_oidc\_issuer | The OIDC Identity issuer for the cluster. | `string` | n/a | yes |
| cluster\_identity\_oidc\_issuer\_arn | The OIDC Identity issuer ARN for the cluster that can be used to associate IAM roles with a service account. | `string` | n/a | yes |
| helm\_chart\_version | External Secrets chart version. | `string` | `"6.1.0"` | no |
| settings |  https://github.com/external-secrets/external-secrets/tree/main/deploy/charts/external-secrets | `map(any)` | `{}` | no |
| mod\_dependency | Dependence variable binds all AWS resources allocated by this module, dependent modules reference this variable | `any` | `null` | no |

## Outputs


<!--- END_TF_DOCS --->

## Authors

Module managed by [Bitpusher, LLC](https://bitpusher.com).

