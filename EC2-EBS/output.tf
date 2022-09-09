# ec2-public-dns
output "ec2_public_dns" {
  value = aws_instance.myec2.public_dns
}

# ec2-public-ip
output "ec2_public_ip" {
  value = aws_instance.myec2.public_ip
}