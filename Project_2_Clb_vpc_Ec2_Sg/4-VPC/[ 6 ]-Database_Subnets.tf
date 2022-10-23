resource "aws_subnet" "Database_Subnet" {
  vpc_id                  = aws_vpc.Vpc-HLI.id
  for_each                = var.Database_Subnet
  availability_zone       = each.value.availability_zone
  cidr_block              = each.value.cidr_block
  map_public_ip_on_launch = true
  tags = merge(var.vpc_tags, {
    Name = "Database_Subnet_${each.key}"
  })
}
