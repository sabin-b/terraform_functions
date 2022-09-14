# Internet_Gateway creation:
resource "aws_internet_gateway" "Internet_Gateway" {
  vpc_id = aws_vpc.Vpc-HLI.id
  tags = merge(var.vpc_tags, {
    "Name" = "Internet_Gateway-${var.vpc_tags["name-of-vpc"]}"
  })
}