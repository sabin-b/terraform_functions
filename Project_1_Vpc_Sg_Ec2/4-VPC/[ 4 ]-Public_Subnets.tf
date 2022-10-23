resource "aws_subnet" "Public_Subnet" {
  vpc_id                  = aws_vpc.Vpc-HLI.id
  for_each                = var.Public_Subnet
  availability_zone       = each.value.availability_zone
  cidr_block              = each.value.cidr_block
  map_public_ip_on_launch = true
  tags = merge(var.vpc_tags, {
    Name = "Public_Subnet_${each.key}"
  })
}


