output "Eip_Public_ip" {
  value = aws_eip.ec2_public.public_ip
}