module security_group {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.0"

  name        = "${var.project}-eks"
  description = "Complete PostgreSQL security group"
  vpc_id      = module.vpc.vpc_id

  # ingress
  ingress_with_cidr_blocks = [
    {
      from_port   = 5432
      to_port     = 5432
      protocol    = "tcp"
      description = "PostgreSQL access from within VPC"
      cidr_blocks = module.vpc.vpc_cidr_block
    },
  ]
}
