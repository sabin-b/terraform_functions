# Create_Database_Route_Table
resource "aws_route_table" "Database_Route_Table" {
  vpc_id = aws_vpc.Vpc-HLI.id
  tags = merge(var.vpc_tags, {
    "Name" = "Database_Route_Table-${var.vpc_tags["name-of-vpc"]}"
  })
}


# Database_Route_Table_Assocication
resource "aws_route_table_association" "Database_Route_Table_Assocication" {
  for_each       = var.Database_Subnet
  subnet_id      = aws_subnet.Database_Subnet[each.key].id
  route_table_id = aws_route_table.Database_Route_Table.id
}