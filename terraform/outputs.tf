output cluster_endpoint {
  description = "Endpoint for EKS control plane"
  value       = module.eks.cluster_endpoint
}

output cluster_security_group_id {
  description = "Security group ids attached to the cluster control plane"
  value       = module.eks.cluster_security_group_id
}

output cluster_name {
  description = "Kubernetes Cluster Name"
  value       = module.eks.cluster_name
}

output public_key_openssh {
  description = "SSH public key"
  value       = module.eks.public_key_openssh
}

output private_key_openssh {
  description = "SSH private key"
  value       = module.eks.private_key_openssh
  sensitive   = true 
}

output oidc_provider_arn {
  description = "OIDC Provider ARN"
  value       = module.eks.oidc_provider_arn
}

output oidc_provider {
  description = "OIDC Provider URL"
  value       = module.eks.oidc_provider
}

output cluster_oidc_issuer_url {
  description = "OIDC Issuer URL"
  value       = module.eks.cluster_oidc_issuer_url
}
  
output production_db_endpoint {
  description = "Username for production RDS"
  value       = module.eks.production_db_endpoint
}
