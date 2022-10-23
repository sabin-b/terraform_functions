# vpc_id
output "vpc_id" {
  value = module.vpc.vpc_id
}

# vpc_cidr_block
output "vpc_cidr_block" {
  value = module.vpc.vpc_cidr
}

# Vpc_Public_Subnets
output "Vpc_Public_Subnet" {
  value = module.vpc.Public_Subnets
}

# Vpc_Private_Subnets
output "Vpc_Private_Subnet" {
  value = module.vpc.Private_Subnets
}