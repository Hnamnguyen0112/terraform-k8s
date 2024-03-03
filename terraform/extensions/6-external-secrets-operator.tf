resource helm_release external_secrets {
  count      = var.destroy ? 0 : 1
  name       = "external-secrets"
  chart      = "external-secrets" 
  repository = "https://charts.external-secrets.io"
  version    = "0.9.4"
  namespace  = "external-secrets"

  set {
    name  = "installCRDs"
    value = "true"
  }

  values = [
    templatefile(
      "./values/external-secrets.yaml", 
      { roleArn = var.external_secrets_irsa_role_arn }
    )
  ]
}

resource kubernetes_service_account_v1 external_secrets {
  count = var.destroy ? 0 : 1
  metadata {
    name = "external-secrets-irsa"
    namespace = "external-secrets"
    annotations = {
      "eks.amazonaws.com/role-arn" = var.external_secrets_irsa_role_arn
    }
  }
}

resource kubernetes_manifest cluster_secret_store {
  count = var.destroy ? 0 : 1
  depends_on = [ helm_release.external_secrets ]
  manifest = yamldecode(templatefile("./values/cluster-secret-store.yaml", {
    region  = var.region
  }))
}

resource kubernetes_manifest next_fe_app_development {
  count = var.destroy ? 0 : 1
  depends_on = [ helm_release.external_secrets ]
  manifest = yamldecode(templatefile("./values/external-secrets/next-fe-app.yaml", {
    namespace = "development"
    project   = var.project
  }))
}

resource kubernetes_manifest next_fe_app_production {
  count = var.destroy ? 0 : 1
  depends_on = [ helm_release.external_secrets ]
  manifest = yamldecode(templatefile("./values/external-secrets/next-fe-app.yaml", {
    namespace = "production"
    project   = var.project
  }))
}
