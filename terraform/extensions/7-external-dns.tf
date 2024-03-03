resource helm_release external_dns {
  count      = var.destroy ? 0 : 1
  chart      = "external-dns"
  namespace  = "kube-system"
  name       = "external-dns"
  version    = "6.26.1"
  repository = "https://charts.bitnami.com/bitnami"

  set {
    name  = "aws.region"
    value = var.region
  }

  set {
    name  = "rbac.create"
    value = "true"
  }

  set {
    name  = "serviceAccount.create"
    value = "true"
  }

  set {
    name  = "serviceAccount.name"
    value = "external-dns"
  }

  set {
    name  = "serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
    value = var.external_dns_irsa_role_arn
  }

  values = [file("./values/external-dns.yaml")]
}
