# Public_Ip
output "Public_Ip" {
  value = aws_instance.Ec2_instance.public_ip
}


# Private_ip
output "Private_ip" {
  value = aws_instance.Ec2_instance.private_ip
}


# Instance_Id
output "Instance_Id" {
  value = aws_instance.Ec2_instance.id
}

