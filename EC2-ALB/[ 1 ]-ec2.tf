# ec2 instance creation - 1

resource "aws_instance" "myec2-1" {
  ami                    = data.aws_ami.amzlinux.id
  instance_type          = var.instance_type
  key_name               = var.key_name
  user_data              = file("apache-install.sh")
  availability_zone      = element(var.availability_zone, 0)
  vpc_security_group_ids = [aws_security_group.ec2-sg.id]
  tags                   = var.tags
   depends_on = [
    aws_lb.Myalb
  ]
}
