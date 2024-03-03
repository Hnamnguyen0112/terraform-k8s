output cluster_endpoint {
  value = module.eks.cluster_endpoint
}

output cluster_security_group_id {
  description = "Security group ids attached to the cluster control plane"
  value       = module.eks.cluster_security_group_id
}

output cluster_name {
  description = "Kubernetes Cluster Name"
  value       = module.eks.cluster_name
}

output cluster_id {
  description = "Kubernetes Cluster ID"
  value       = module.eks.cluster_id
}

output public_key_openssh {
  description = "SSH public key"
  value       = tls_private_key.argocd_ssh_key.public_key_openssh
}

output private_key_openssh {
  description = "SSH private key"
  value       = tls_private_key.argocd_ssh_key.private_key_openssh
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

output cluster_certificate_authority_data {
  description = "The base64 encoded certificate data required to communicate with your cluster."
  value       = module.eks.cluster_certificate_authority_data
}

# Iam Roles
output external_dns_irsa_role_arn {
  description = "IAM Role ARN for external dns"
  value       = module.external_dns_irsa_role.iam_role_arn
}

output cluster_autoscaler_irsa_role_arn {
  description = "IAM Role ARN for cluster autoscaler"
  value       = module.cluster_autoscaler_irsa_role.iam_role_arn
}

output external_secrets_irsa_role_arn {
  description = "IAM Role ARN for external secrets"
  value       = module.external_secrets_irsa_role.iam_role_arn
}

output load_balancer_controller_irsa_role_arn {
  description = "IAM Role ARN for load balancer controller"
  value       = module.load_balancer_controller_irsa_role.iam_role_arn
}

output ebs_csi_irsa_role_arn {
  description = "IAM Role ARN for ebs csi"
  value       = module.ebs_csi_irsa_role.iam_role_arn
}

output argocd_private_key_openssh {
  description = "SSH private key for argocd"
  value       = tls_private_key.argocd_ssh_key.private_key_openssh
  sensitive   = true
}

output production_db_endpoint {
  description = "Development DB Port"
  value       = module.production_db.db_instance_endpoint
}
