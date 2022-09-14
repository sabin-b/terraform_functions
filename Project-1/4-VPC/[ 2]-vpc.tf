# create vpc resource block
resource "aws_vpc" "Vpc-HLI" {
  cidr_block           = var.cidr_block_for_vpc
  instance_tenancy     = var.instance_tenancy
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags                 = merge(var.vpc_tags,{
    "Name"="Vpc-Hli"
  }) 
}