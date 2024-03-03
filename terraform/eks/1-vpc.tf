data aws_availability_zones available {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}

module vpc {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.1.1"

  name = "${var.project}-vpc"
  cidr = var.cidr_block

  azs               = slice(data.aws_availability_zones.available.names, 0, 2)
  private_subnets   = local.private_subnets
  public_subnets    = local.public_subnets
  database_subnets  = local.database_subnets
  intra_subnets     = local.intra_subnets

  enable_nat_gateway     = true
  single_nat_gateway     = true

  enable_dns_hostnames = true
  enable_dns_support   = true

  create_database_subnet_group = true

  public_subnet_tags = {
    "kubernetes.io/role/elb"                    = 1
    "kubernetes.io/cluster/${var.project}" = "shared"
  }

  private_subnet_tags = {
    "kubernetes.io/role/internal-elb"           = 1
    "kubernetes.io/cluster/${var.project}" = "shared"
  }

  tags = {
    Operator = "Terraform"
  }
}

locals {
  private_subnets = [
    cidrsubnet(var.cidr_block, 8, 1),
    cidrsubnet(var.cidr_block, 8, 2),
  ]
  public_subnets = [
    cidrsubnet(var.cidr_block, 8, 3),
    cidrsubnet(var.cidr_block, 8, 4),
  ]
  database_subnets = [
    cidrsubnet(var.cidr_block, 8, 5),
    cidrsubnet(var.cidr_block, 8, 6),
  ]
  intra_subnets = [
    cidrsubnet(var.cidr_block, 8, 7),
    cidrsubnet(var.cidr_block, 8, 8),
  ]
}
