resource helm_release argocd {
  count            = var.destroy ? 0 : 1
  name             = "argocd"
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  namespace        = "argocd"
  version          = "3.35.4"
  values           = [file("./values/argocd.yaml")]
}

resource kubernetes_secret_v1 argocd_repo_secret {
  count = var.destroy ? 0 : 1
  type = "Opaque"
  depends_on = [ helm_release.argocd ]

  metadata {
    name      = "argocd-repo-secret"
    namespace = "argocd"
    labels = {
      "argocd.argoproj.io/secret-type" = "repo-creds"
    }
  }

  data = {
    url      = var.infra_repo
    sshPrivateKey = var.argocd_private_key_openssh
    insecure = "false"
    enableLfs = "false"
  }
}
