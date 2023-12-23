output "vpc" {
  value = {
    vpc_id             = module.vpc.vpc_id
    availability_zones = module.vpc.azs
    subnets            = {
      private = module.vpc.private_subnets
      public  = module.vpc.public_subnets
    }
    subnet_groups      = {
      database    = module.vpc.database_subnet_group_name
      elasticache = module.vpc.elasticache_subnet_group_name
    }
  }
}

output "name" {
  value = module.vpc.name
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "vpc_cidr" {
  value = var.cidr
}

output "secondary_cidr_blocks" {
  value = module.vpc.vpc_secondary_cidr_blocks
}

output "vpc_cidr_blocks" {
  value = sort(distinct(concat(
    [var.cidr],
    module.vpc.vpc_secondary_cidr_blocks
  )))
}

output "public_subnets" {
  value = module.vpc.public_subnets
}

output "public_route_table_ids" {
  value = module.vpc.public_route_table_ids
}

output "private_subnets" {
  value = module.vpc.private_subnets
}

output "private_route_table_ids" {
  value = module.vpc.private_route_table_ids
}

output "availability_zones" {
  value = module.vpc.azs
}

output "nat_public_ips" {
  value = module.vpc.nat_public_ips
}

output "database_subnet_group_name" {
  value = module.vpc.database_subnet_group_name
}

output "elasticache_subnet_group_name" {
  value = module.vpc.elasticache_subnet_group_name
}

output "rds_shared_sg_id" {
  value = module.rds_sg.security_group_id
}

output "rds_shared_sg_name" {
  value = module.rds_sg.security_group_id
}
