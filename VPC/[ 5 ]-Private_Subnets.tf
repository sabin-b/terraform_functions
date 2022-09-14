resource "aws_subnet" "Private_Subnet" {
  vpc_id                  = aws_vpc.Vpc-HLI.id
  for_each                = var.Private_Subnet
  availability_zone       = each.value.availability_zone
  cidr_block              = each.value.cidr_block
  map_public_ip_on_launch = true
  tags = merge(var.vpc_tags, {
    Name = "Private_Subnet_${each.key}"
  })
}

