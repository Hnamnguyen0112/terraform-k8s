resource helm_release argocd_image_updater {
  count            = var.destroy ? 0 : 1
  name = "updater"

  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argocd-image-updater"
  namespace        = "argocd"
  version          = "0.9.0"

  values = [file("./values/updater.yaml")]
}
