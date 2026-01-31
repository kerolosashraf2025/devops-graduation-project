
# EKS Managed Node Group


resource "aws_eks_node_group" "this" {
  cluster_name    = aws_eks_cluster.this.name
  node_group_name = "${var.cluster_name}-node-group"

  node_role_arn = aws_iam_role.eks_node_role.arn

  # Worker nodes 
  subnet_ids = var.private_subnet_ids

  # IMPORTANT:
  ami_type = "AL2023_x86_64_STANDARD"


  capacity_type = "ON_DEMAND"

  scaling_config {
    desired_size = var.node_desired_size
    max_size     = var.node_max_size
    min_size     = var.node_min_size
  }

  instance_types = var.node_instance_types

  depends_on = [
    aws_iam_role_policy_attachment.node_worker_policy,
    aws_iam_role_policy_attachment.node_cni_policy,
    aws_iam_role_policy_attachment.node_ecr_policy
  ]
}
