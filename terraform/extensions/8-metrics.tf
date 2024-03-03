resource helm_release metric-server {
  count      = var.destroy ? 0 : 1
  name       = "metric-server"
  repository = "https://charts.bitnami.com/bitnami" 
  chart      = "metrics-server"
  namespace = "kube-system"
  
  set {
    name  = "apiService.create"
    value = "true"
  }
}
