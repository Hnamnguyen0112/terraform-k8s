terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.14.0"
    }

    helm = {
      source  = "hashicorp/helm"
      version = "2.11.0"
    }

    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.23.0"
    }
  }

  backend s3 {
    bucket         = var.aws_s3_bucket 
    key            = "eks/terraform.tfstate"
    dynamodb_table = var.aws_dynamic_table 
    region         = var.aws_region 
    encrypt        = true
  }

  required_version = ">= 1.5.0"
}
