variable project {
  type = string
  default = "default"
}

variable region {
  type = string
  default = "ap-southeast-1"
}

variable infra_repo {
  type = string
  default = ""
}

variable eks_cluster_name {
  type = string
  default = ""
}

variable eks_cluster_endpoint {
  type = string
  default = ""
}

variable external_dns_irsa_role_arn {
  type = string
  default = ""
}

variable cluster_autoscaler_irsa_role_arn {
  type = string
  default = ""
}

variable external_secrets_irsa_role_arn {
  type = string
  default = ""
}

variable load_balancer_controller_irsa_role_arn {
  type = string
  default = ""
}

variable argocd_private_key_openssh {
  type = string
  default = ""
}

variable cluster_certificate_authority_data {
  type = string
  default = ""
}

variable destroy {
  type = bool
  default = false
}
