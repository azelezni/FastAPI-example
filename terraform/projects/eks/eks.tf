module "eks" {
  source = "terraform-aws-modules/eks/aws"

  cluster_name    = var.name
  cluster_version = "1.27"

  cluster_endpoint_public_access = false

  vpc_id                   = data.terraform_remote_state.vpc.outputs.vpc.vpc_id
  subnet_ids               = data.terraform_remote_state.vpc.outputs.vpc.subnets.private
  control_plane_subnet_ids = data.terraform_remote_state.vpc.outputs.vpc.subnets.private

  eks_managed_node_groups = {
    workers = {
      min_size     = 1
      max_size     = 10
      desired_size = 1

      instance_types = ["t3.large"]
      capacity_type  = "SPOT"
    }
  }

  tags = {
    Name = var.name
  }
}
