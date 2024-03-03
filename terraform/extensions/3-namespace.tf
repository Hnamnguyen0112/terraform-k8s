resource kubernetes_namespace_v1 development {
  count = var.destroy ? 0 : 1
  metadata {
    annotations = {
      name = "development"
    }
    name = "development"
  }
}

resource kubernetes_namespace_v1 staging {
  count = var.destroy ? 0 : 1
  metadata {
    annotations = {
      name = "staging"
    }
    name = "staging"
  }
}

resource kubernetes_namespace_v1 production {
  count = var.destroy ? 0 : 1
  metadata {
    annotations = {
      name = "production"
    }
    name = "production"
  }
}

resource kubernetes_namespace_v1 argocd {
  count = var.destroy ? 0 : 1
  metadata {
    annotations = {
      name = "argocd"
    }
    name = "argocd"
  }
}

resource kubernetes_namespace_v1 external_secrets {
  count = var.destroy ? 0 : 1
  metadata {
    annotations = {
      name = "external-secrets"
    }
    name = "external-secrets"
  }
}
