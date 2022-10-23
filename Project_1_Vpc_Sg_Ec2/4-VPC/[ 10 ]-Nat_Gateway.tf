# Create Nat_Gateway
resource "aws_nat_gateway" "Nat_Gateway" {
  allocation_id = aws_eip.Elastic_Ip.id
  subnet_id     = aws_subnet.Public_Subnet["ap-south-1a"].id
  depends_on    = [aws_internet_gateway.Internet_Gateway]
  tags = merge(var.vpc_tags, {
    "Name" = "Nat_Gateway-${var.vpc_tags["name-of-vpc"]}"
  })
}