# region 
/*variable "region" {
  type        = string
  description = "this region the resources going to create"
}*/

# vpc variables
variable "instance_tenancy" {
  type        = string
  description = "instance_tenancy for vpc"
  default = "default"
}

# cidr_block for  vpc
variable "cidr_block_for_vpc" {
  type        = string
  description = "cidr_block_for_vpc"
}

# vpc- tags
variable "vpc_tags" {
  type        = map(string)
  description = "vpc_tags"
  /*default = {
    "name-of-vpc"  = "Vpc-HLI"
    "Company_Name" = "ABC-Corp"
    "Network"      = "type-01"
    "Owner"        = "Us-client"
    "project"      = "Health-insurance"
    "project-id"   = "000122"
  }*/
}

# subnets section -public

# Public_Subnet
variable "Public_Subnet" {
  type = map(object({
    availability_zone = string
    cidr_block        = string
  }))
}

# Private_Subnet
variable "Private_Subnet" {
  type = map(object({
    availability_zone = string
    cidr_block        = string
  }))
}


# Database_Subnets
variable "Database_Subnet" {
  type = map(object({
    availability_zone = string
    cidr_block        = string
  }))
}