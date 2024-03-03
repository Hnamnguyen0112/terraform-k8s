# resource "aws_eks_addon" "vpc-cni" {
#   cluster_name  = var.cluster_name
#   addon_name    = "vpc-cni"
#   addon_version = local.vpccni_version
#   configuration_values = jsonencode({
#     "env" = {
#       "ENABLE_PREFIX_DELEGATION" = tostring(var.vpccni_prefix_delegation_enabled)
#     }
#   })
#   resolve_conflicts_on_create = "OVERWRITE"
#   resolve_conflicts_on_update = "OVERWRITE"
# }
#
# resource "aws_eks_addon" "coredns" {
#   cluster_name                = var.cluster_name
#   addon_name                  = "coredns"
#   addon_version               = local.coredns_version
#   resolve_conflicts_on_create = "OVERWRITE"
#   resolve_conflicts_on_update = "OVERWRITE"
# }
#
# resource "aws_eks_addon" "kube-proxy" {
#   cluster_name                = var.cluster_name
#   addon_name                  = "kube-proxy"
#   addon_version               = local.kubeproxy_version
#   resolve_conflicts_on_create = "OVERWRITE"
#   resolve_conflicts_on_update = "OVERWRITE"
# }

resource aws_eks_addon aws_ebs_csi_driver {
  cluster_name                = module.eks.cluster_name
  addon_name                  = "aws-ebs-csi-driver"
  addon_version               = "v1.23.0-eksbuild.1"
  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "OVERWRITE"
  service_account_role_arn    = module.ebs_csi_irsa_role.iam_role_arn
}
