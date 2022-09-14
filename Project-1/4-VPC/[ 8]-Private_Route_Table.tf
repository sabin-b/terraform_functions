# Create_Private_Route_Table
resource "aws_route_table" "Private_Route_Table" {
  vpc_id = aws_vpc.Vpc-HLI.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.Nat_Gateway.id
  }

  tags = merge(var.vpc_tags, {
    "Name" = "Private_Route_Table-${var.vpc_tags["name-of-vpc"]}"
  })
}

# Resource-5: Create Route in Route Table for Internet Access
/*resource "aws_route" "Private-Route" {
  for_each               = var.Public_Subnet
  route_table_id         = aws_route_table.Private_Route_Table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_nat_gateway.Nat_Gateway.id

  timeouts {
    create = "5m"
  }
}*/


# Private_Route_Table_Assocication
resource "aws_route_table_association" "Private_Route_Table_Assocication" {
  for_each       = var.Private_Subnet
  subnet_id      = aws_subnet.Private_Subnet[each.key].id
  route_table_id = aws_route_table.Private_Route_Table.id
}