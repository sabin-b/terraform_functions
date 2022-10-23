# Create_Public_Route_Table
resource "aws_route_table" "Public_Route_Table" {
  vpc_id = aws_vpc.Vpc-HLI.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.Internet_Gateway.id
  }

  tags = merge(var.vpc_tags, {
    "Name" = "Public_Route_Table-${var.vpc_tags["name-of-vpc"]}"
  })
}


# Public_Route_Table_Assocication
resource "aws_route_table_association" "Public_Route_Table_Assocication" {
  for_each       = var.Public_Subnet
  subnet_id      = aws_subnet.Public_Subnet[each.key].id
  route_table_id = aws_route_table.Public_Route_Table.id
}