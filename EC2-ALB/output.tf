# instance public ip - 1
output "ec2-public-ip-1" {
  value = aws_instance.myec2-1.public_ip
}

# instance public dns - 1
output "ec2-public-dns-1" {
  value = aws_instance.myec2-1.public_dns
}


# instance public ip - 2
output "ec2-public-ip-2" {
  value = aws_instance.myec2-2.public_ip
}

# instance public dns - 2
output "ec2-public-dns-2" {
  value = aws_instance.myec2-2.public_dns
}

# application load balancer dns
output "application_load_balancer_dns" {
  value = aws_lb.Myalb.dns_name
}