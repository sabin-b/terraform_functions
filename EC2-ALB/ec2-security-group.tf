# ec2 security group
resource "aws_security_group" "ec2-sg" {
  name        = "ec2-security_group"
  description = "ec2-security_group"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.ec2-security-group
    content {
      description = ingress.value.description
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = ingress.value.protocol
      #cidr_blocks = ingress.value.cidr_blocks
      security_groups = [aws_security_group.alb-security_group.id]
    }
  }
  egress {
    description = "allow all ports"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}