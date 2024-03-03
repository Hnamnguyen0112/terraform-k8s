module eks {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.16.0"

  cluster_name              = var.project
  cluster_version           = var.cluster_version
  subnet_ids                = module.vpc.private_subnets
  control_plane_subnet_ids  = module.vpc.intra_subnets
  vpc_id                    = module.vpc.vpc_id
  
  cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = true
  cluster_enabled_log_types = var.cluster_enabled_log_types

  create_kms_key                  = false
  cluster_encryption_config = {
    provider_key_arn = aws_kms_key.eks.arn
    resources = ["secrets"]
  }

  enable_irsa = true

  aws_auth_node_iam_role_arns_non_windows = [
    module.eks_managed_non_gpu_2vcpu_8gbmem.iam_role_arn,
    module.eks_managed_non_gpu_4vcpu_16gbmem.iam_role_arn,
    module.eks_managed_non_gpu_8vcpu_32gbmem.iam_role_arn,
  ]

  aws_auth_roles = [
    {
      rolearn  = module.eks_managed_non_gpu_2vcpu_8gbmem.iam_role_arn
      username = "system:node:{{EC2PrivateDNSName}}"
      groups = [
        "system:bootstrappers",
        "system:nodes",
      ]
    },
    {
      rolearn  = module.eks_managed_non_gpu_4vcpu_16gbmem.iam_role_arn
      username = "system:node:{{EC2PrivateDNSName}}"
      groups = [
        "system:bootstrappers",
        "system:nodes",
      ]
    },
    {
      rolearn  = module.eks_managed_non_gpu_8vcpu_32gbmem.iam_role_arn
      username = "system:node:{{EC2PrivateDNSName}}"
      groups = [
        "system:bootstrappers",
        "system:nodes",
      ]
    },
  ]
}
