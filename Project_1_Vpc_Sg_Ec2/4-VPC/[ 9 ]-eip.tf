# Create_Eip 
resource "aws_eip" "Elastic_Ip" {
  vpc        = true
  depends_on = [aws_internet_gateway.Internet_Gateway]
  tags = merge(var.vpc_tags, {
    "Name" = "Elastic_Ip_For_Private_Subnet-${var.vpc_tags["name-of-vpc"]}"
  })
}