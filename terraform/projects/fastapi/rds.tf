module "rds" {
  source = "terraform-aws-modules/rds/aws"

  identifier = "${var.name}-fastapi"

  engine               = "postgres"
  engine_version       = "14"
  family               = "postgres14" # DB parameter group
  major_engine_version = "14"         # DB option group
  instance_class       = "db.t4g.large"

  allocated_storage     = 20
  max_allocated_storage = 100

  db_name  = "fastapi"
  username = "postgres"
  # Change after initial creation
  password = "fakepass"

  db_subnet_group_name   = data.terraform_remote_state.vpc.outputs.vpc.subnet_groups.database
  vpc_security_group_ids = [data.terraform_remote_state.vpc.outputs.vpc.subnet_groups.rds_shared_sg_id]

  tags = {
    Name = "${var.name}-fastapi"
  }
}
