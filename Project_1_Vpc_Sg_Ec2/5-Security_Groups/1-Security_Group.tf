# Private_Ec2_Security_Group
resource "aws_security_group" "Security_Group" {
  name        = var.Security_Group_Name
  description = var.Security_Group_Name
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.Ingress_For_Security_Group
    content {
      description = ingress.value.description
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }
  egress {
    description = "Allow All Ports"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.Security_Group_Tags

}