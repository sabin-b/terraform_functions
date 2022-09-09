# ec2 security group
resource "aws_security_group" "ec2-sg" {
  name        = join("-", [var.ec2-security-group-name, "${element(var.environment, 0)}"])
  description = join("-", [var.ec2-security-group-name, "${element(var.environment, 0)}"])
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.ec2-security-group
    content {
      description = ingress.value.description
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }
  egress {
    description = "allow all ports"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = merge(var.ec2-tags, var.security-group-tags, {
    Monitor = contains(["Dev", "Prod", "Stag"], "${element(var.environment, 0)}") ? "cloudwatch" : ""
  })
}