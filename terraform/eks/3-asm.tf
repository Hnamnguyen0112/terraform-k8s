resource tls_private_key argocd_ssh_key {
  algorithm = "ED25519"
}

resource aws_secretsmanager_secret argocd_ssh_key {
  name = "argocd-ssh-key"
  description = "ArgoCD SSH Key"

  recovery_window_in_days = 0

  tags = {
    Name = "argocd-ssh-key"
  }
}

resource aws_secretsmanager_secret_version argocd_ssh_key {
  secret_id = aws_secretsmanager_secret.argocd_ssh_key.id
  secret_string = tls_private_key.argocd_ssh_key.private_key_openssh
}

resource aws_secretsmanager_secret next_fe_app_development {
  name = "${var.project}/development/next-fe-app"
  description = "Next FE App Development"

  recovery_window_in_days = 0

  tags = {
    Name = "${var.project}/development/next-fe-app"
  }
}

resource aws_secretsmanager_secret next_fe_app_production {
  name = "${var.project}/production/next-fe-app"
  description = "Next FE App Production"

  recovery_window_in_days = 0

  tags = {
    Name = "${var.project}/production/next-fe-app"
  }
}


