# Module vpc
module "vpc" {
  source             = "./4-VPC"
  instance_tenancy   = var.instance_tenancy
  cidr_block_for_vpc = var.cidr_block_for_vpc
  Public_Subnet      = var.Public_Subnet
  Private_Subnet     = var.Private_Subnet
  Database_Subnet    = var.Database_Subnet
  vpc_tags = merge(var.vpc_tags, {
    "Name" = "Vpc-HLI"
  })
}

# Module Public_Security_Group
module "Public_Security_Group" {
  source                     = "./5-Security_Groups"
  vpc_id                     = module.vpc.vpc_id
  Ingress_For_Security_Group = var.Public_Security_Group_Ingress
  Security_Group_Name        = join("-", [var.public_Security_Group_Name, "${element(var.Environment, 0)}"])
  Security_Group_Tags = merge(var.vpc_tags, {
    "Name" = "Public_security_Group"
  })
 depends_on = [module.vpc]
}

# Module Private_Security_Group
module "Private_Security_Group" {
  source                     = "./5-Security_Groups"
  vpc_id                     = module.vpc.vpc_id
  Ingress_For_Security_Group = var.Private_Security_Group_Ingress
  Security_Group_Name        = join("-", [var.private_Security_Group_Name, "${element(var.Environment, 0)}"])
  Security_Group_Tags = merge(var.vpc_tags, {
    "Name" = "Private_security_Group"
  })
  depends_on = [module.vpc]
}

# Ec2_Instance_Public
module "Ec2_Instance_Public" {
  source                 = "./3-Ec2"
  for_each               = toset(["0"])
  ami_id                 = data.aws_ami.amzlinux2.id
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id            = element(module.vpc.Public_Subnets,tonumber(each.key))
  vpc_security_group_ids = [module.Public_Security_Group.Security_Group_id]
  Ec2_Tags = merge(var.vpc_tags, {
    "Name" = join("-", ["Public_Ec2_Instance", "${element(var.Environment, 0)}"])
  })
  depends_on = [module.Public_Security_Group]
}

# Ec2_Instance_Private
module "Ec2_Instance_Private" {
  source                 = "./3-Ec2"
  for_each               = toset(["0", "1"])
  ami_id                 = data.aws_ami.amzlinux2.id
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id           = element(module.vpc.Public_Subnets,tonumber(each.key))
  User_Data = file("${path.module}/17-User_Data.sh")
  vpc_security_group_ids = [module.Private_Security_Group.Security_Group_id]
  Ec2_Tags = merge(var.vpc_tags, {
    "Name" = join("-", ["Private_Ec2_Instance", "${element(var.Environment, 0)}"])
  })
   depends_on = [module.Private_Security_Group]
}