# create ec2 instance
resource "aws_instance" "myec2" {
  ami                         = data.aws_ami.amzlinux.id
  availability_zone           = element(var.availability_zone, 0)
  associate_public_ip_address = true
  instance_type               = element(var.instance_type, 0)
  key_name                    = var.key_name
  user_data                   = templatefile("user_data.tmpl", { package_name = var.package_name })
  vpc_security_group_ids      = [aws_security_group.ec2-sg.id]
  tags = merge(var.ec2-tags, var.security-group-tags, {
    Monitor = contains(["Dev", "Prod", "Stag"], "${element(var.environment, 0)}") ? "cloudwatch" : ""
  })
}