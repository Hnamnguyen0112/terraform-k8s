module eks_managed_non_gpu_2vcpu_8gbmem {
  source = "terraform-aws-modules/eks/aws//modules/eks-managed-node-group"
  version = "19.16.0"

  name            = "non-gpu-2vcpu-8gbmem"
  cluster_name    = module.eks.cluster_name
  cluster_version = module.eks.cluster_version

  subnet_ids                        = module.vpc.private_subnets
  cluster_primary_security_group_id = module.eks.cluster_primary_security_group_id
  vpc_security_group_ids            = [ module.eks.cluster_security_group_id ]

  instance_types = ["m6i.large", "m5.large", "m5n.large", "m5zn.large"]

  min_size       = 0
  max_size       = 5
  desired_size   = 1

  ami_type = "AL2_x86_64"
  use_custom_launch_template = false
  disk_size = 128

  labels = {
    "role" = "non-gpu-2vcpu-8gbmem"
  }
}

module eks_managed_non_gpu_4vcpu_16gbmem {
  source = "terraform-aws-modules/eks/aws//modules/eks-managed-node-group"
  version = "19.16.0"

  name            = "non-gpu-4vcpu-16gbmem"
  cluster_name    = module.eks.cluster_name
  cluster_version = module.eks.cluster_version

  subnet_ids                        = module.vpc.private_subnets
  cluster_primary_security_group_id = module.eks.cluster_primary_security_group_id
  vpc_security_group_ids            = [ module.eks.cluster_security_group_id ]

  instance_types = ["m6i.xlarge", "m5.xlarge", "m5zn.xlarge", "m5n.xlarge"]

  min_size       = 0
  max_size       = 5
  desired_size   = 1

  ami_type = "AL2_x86_64"
  use_custom_launch_template = false
  disk_size = 128

  labels = {
    "role" = "non-gpu-4vcpu-16gbmem"
  }
}

module eks_managed_non_gpu_8vcpu_32gbmem {
  source = "terraform-aws-modules/eks/aws//modules/eks-managed-node-group"
  version = "19.16.0"

  name            = "non-gpu-8vcpu-32gbmem"
  cluster_name    = module.eks.cluster_name
  cluster_version = module.eks.cluster_version

  subnet_ids                        = module.vpc.private_subnets
  cluster_primary_security_group_id = module.eks.cluster_primary_security_group_id
  vpc_security_group_ids            = [ module.eks.cluster_security_group_id ]

  instance_types = ["m6i.2xlarge", "m5.2xlarge", "m5zn.2xlarge", "m5n.2xlarge"]

  min_size       = 0
  max_size       = 5
  desired_size   = 1

  ami_type = "AL2_x86_64"
  use_custom_launch_template = false
  disk_size = 128

  labels = {
    "role" = "non-gpu-8vcpu-32gbmem"
  }
}
