# ec2 instance creation - 2

resource "aws_instance" "myec2-2" {
  ami                    = data.aws_ami.amzlinux.id
  instance_type          = var.instance_type
  key_name               = var.key_name
  user_data              = file("apache-install.sh")
  availability_zone      = element(var.availability_zone, 1)
  vpc_security_group_ids = [aws_security_group.ec2-sg.id]
  tags                   = var.tags
  depends_on = [
    aws_lb.Myalb
  ]
}


# Wait for 90 seconds after creating the above EC2 Instance 
resource "time_sleep" "wait_90_seconds" {
  depends_on      = [aws_instance.myec2-2]
  create_duration = "90s"
}

# Sync App1 Static Content to Webserver using Provisioners
resource "null_resource" "sync_app1_static" {
  depends_on = [time_sleep.wait_90_seconds]
  triggers = {
    always-update = timestamp()
  }

  # Connection Block for Provisioners to connect to EC2 Instance
  connection {
    type        = "ssh"
    host        = aws_instance.myec2-2.public_ip
    user        = "ec2-user"
    password    = ""
    private_key = file("private-key/myterrakey.pem")
  }

  # Copies the app1 folder to /tmp
  provisioner "file" {
    source      = "apps/Myapp"
    destination = "/tmp"
  }

  # Copies the /tmp/app1 folder to Apache Webserver /var/www/html directory
  provisioner "remote-exec" {
    inline = [
      "sudo cp -R /tmp/Myapp /var/www/html"
    ]
  }
}