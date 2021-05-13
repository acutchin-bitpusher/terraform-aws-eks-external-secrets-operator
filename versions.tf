terraform {
  required_version = ">= 0.14"
  required_providers {
    aws        = {
      source = "hashicorp/aws"
      version = ">= 3.39.0"
    }
    helm       = ">= 2.1.2"
    kubernetes = ">= 2.1.0"
  }
}
