module "rds_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 5.1.0"

  create          = true
  use_name_prefix = true

  name        = "${var.name}-rds"
  description = "${title(var.name)} VPC shared RDS security group"
  vpc_id      = module.vpc.vpc_id

  egress_rules       = ["all-all"]
  egress_cidr_blocks = ["0.0.0.0/0"]

  ingress_with_cidr_blocks = [
    {
      rule        = "postgresql-tcp"
      description = "${title(var.name)} Private subnets"
      cidr_blocks = join(",", module.vpc.private_subnets_cidr_blocks)
    },
    {
      rule        = "postgresql-tcp"
      description = "${title(var.name)} Public subnets"
      cidr_blocks = join(",", module.vpc.public_subnets_cidr_blocks)
    },
  ]

  tags = {
    Name = "${var.name}-rds"
  }
}
