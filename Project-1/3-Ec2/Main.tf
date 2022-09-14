# Create_Ec2_instance
resource "aws_instance" "Ec2_instance" {
  ami = var.ami_id
  instance_type = var.instance_type
  key_name = var.key_name
  subnet_id = var.subnet_id
  user_data = var.User_Data
  vpc_security_group_ids = var.vpc_security_group_ids
  tags = var.Ec2_Tags
}