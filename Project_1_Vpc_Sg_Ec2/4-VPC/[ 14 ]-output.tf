# vpc id
output "vpc_id" {
  value = aws_vpc.Vpc-HLI.id
}

# vpc cidr
output "vpc_cidr" {
  value = aws_vpc.Vpc-HLI.cidr_block
}

# Vpc Public_Subnets
output "Public_Subnets" {
  value = tolist([for subnet in aws_subnet.Public_Subnet : subnet.id ])
}

# Vpc Private_Subnets
output "Private_Subnets" {
  value = [for subnet in aws_subnet.Private_Subnet : subnet.id ]
}



