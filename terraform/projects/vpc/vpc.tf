module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.name
  cidr = var.cidr
  azs  = [
    "eu-west-1a",
    "eu-west-1b",
    "eu-west-1c"
  ]

  public_subnets      = [
    cidrsubnet(var.cidr, 3, 0), # X.X.0.0/19
    cidrsubnet(var.cidr, 3, 1), # X.X.32.0/19
    cidrsubnet(var.cidr, 3, 2)  # X.X.64.0/19
  ]
  private_subnets     = [
    cidrsubnet(var.cidr, 3, 3), # X.X.96.0/19
    cidrsubnet(var.cidr, 3, 4), # X.X.128.0/19
    cidrsubnet(var.cidr, 3, 5)  # X.X.160.0/19
  ]
  database_subnets    = [
    cidrsubnet(var.cidr, 8, 192), # X.X.192.0/24
    cidrsubnet(var.cidr, 8, 193), # X.X.193.0/24
    cidrsubnet(var.cidr, 8, 194)  # X.X.194.0/24
  ]
  elasticache_subnets = [
    cidrsubnet(var.cidr, 8, 195), # X.X.195.0/24
    cidrsubnet(var.cidr, 8, 196), # X.X.196.0/24
    cidrsubnet(var.cidr, 8, 197)  # X.X.197.0/24
  ]

  private_subnet_tags = {
    "kubernetes.io/role/internal-elb" = 1
  }

  public_subnet_tags = {
    "kubernetes.io/role/elb" = 1
  }
}
