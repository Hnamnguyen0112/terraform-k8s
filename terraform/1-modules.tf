module eks {
  source = "./eks"

  project = var.project
  region  = var.region

  cidr_block = var.cidr_block

  cluster_version               = var.cluster_version
  cluster_enabled_log_types     = var.cluster_enabled_log_types

  infra_repo = var.infra_repo

  rds_development_username = var.rds_development_username
  rds_development_password = var.rds_development_password
  rds_development_db_name  = var.rds_development_db_name
  rds_development_port     = var.rds_development_port

  rds_production_username = var.rds_production_username
  rds_production_password = var.rds_production_password
  rds_production_db_name  = var.rds_production_db_name
  rds_production_port     = var.rds_production_port
}

module extensions {
  source = "./extensions"

  project = var.project

  region                              = var.region
  infra_repo                          = var.infra_repo
  eks_cluster_name                    = module.eks.cluster_name
  eks_cluster_endpoint                = module.eks.cluster_endpoint
  cluster_certificate_authority_data  = module.eks.cluster_certificate_authority_data
 
  external_dns_irsa_role_arn              = module.eks.external_dns_irsa_role_arn
  cluster_autoscaler_irsa_role_arn        = module.eks.cluster_autoscaler_irsa_role_arn 
  external_secrets_irsa_role_arn          = module.eks.external_secrets_irsa_role_arn
  load_balancer_controller_irsa_role_arn  = module.eks.load_balancer_controller_irsa_role_arn
  argocd_private_key_openssh              = module.eks.argocd_private_key_openssh
}
