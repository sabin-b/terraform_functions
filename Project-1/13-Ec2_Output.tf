# Public_Ec2_Public_Ip
/*output "Public_Ec2_Public_Ip" {
  # value = module.Ec2_Instance_Public.Public_Ip
  value = [for ip in module.Ec2_Instance_Public: ip.Public_Ip]
}
*/

# Public_Ec2_Private_ip
output "Public_Ec2_Private_ip" {
  #value = module.Ec2_Instance_Public.Private_ip
  value = [for ip in module.Ec2_Instance_Public: ip.Private_ip]
}

#####

# Private_Ec2_Public_Ip

/*output "Private_Ec2_Public_Ip" {
  value = module.Ec2_Instance_Private.Public_Ip
}*/


# Private_Ec2_Private_ip
output "Private_Ec2_Private_ip" {
  value = [for instance in module.Ec2_Instance_Private : instance.Private_ip]
}