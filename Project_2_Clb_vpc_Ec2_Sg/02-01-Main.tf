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
  subnet_id              = element(module.vpc.Public_Subnets, tonumber(each.key))
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
  subnet_id              = element(module.vpc.Public_Subnets, tonumber(each.key))
  User_Data              = file("${path.module}/17-User_Data.sh")
  vpc_security_group_ids = [module.Private_Security_Group.Security_Group_id]
  Ec2_Tags = merge(var.vpc_tags, {
    "Name" = join("-", ["Private_Ec2_Instance", "${element(var.Environment, 0)}"])
  })
  depends_on = [module.Private_Security_Group]
}

# Classical_Load_Balancer_Security_Group
module "Classical_Load_Balancer_Security_Group" {
  source                     = "./5-Security_Groups"
  vpc_id                     = module.vpc.vpc_id
  Ingress_For_Security_Group = var.Clb_Security_Group_Ingress
  Security_Group_Name        = join("-", [var.Clb_Security_Group_Name, "${element(var.Environment, 0)}"])
  Security_Group_Tags = merge(var.vpc_tags, {
    "Name" = "Clb_security_Group"
  })
  depends_on = [module.vpc]
}

/*# Classical_Load_Balancer
module "Classical_Load_Balancer" {
  source                 = "./6-Clb"
  Elb_Name               = join("-", [var.Clb_Name, "${element(var.Environment, 0)}"])
  Elb_availability_zones = var.Clb_availability_zones
  Elb_security_group_id  = [module.Classical_Load_Balancer_Security_Group.Security_Group_id]
  Elb_Instances_Attach   = [ module.Ec2_Instance_Private[0].Instance_Id,module.Ec2_Instance_Private[1].Instance_Id]
  Elb_Tags = merge(var.vpc_tags, {
    "Name" = "Classical_Load_Balancer"
  })
  depends_on = [module.vpc, module.Ec2_Instance_Private]
}*/

# Classical_Load_Balancer
module "elb" {
  source  = "terraform-aws-modules/elb/aws"
  version = "2.5.0"
  name = join("-", [var.Clb_Name, "${element(var.Environment, 0)}"])
  subnets = [
    module.vpc.Public_Subnets[0], 
    module.vpc.Public_Subnets[1]
  ]
  listener = [
    {
      instance_port     = 80
      instance_protocol = "HTTP"
      lb_port           = 80
      lb_protocol       = "HTTP"
    },
    {
      instance_port     = 80
      instance_protocol = "HTTP"
      lb_port           = 81
      lb_protocol       = "HTTP"
    },
  ]   

  health_check = {
    target              = "HTTP:80/"
    interval            = 30
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
  }

  security_groups = [module.Classical_Load_Balancer_Security_Group.Security_Group_id]

  # ELB attachments
  number_of_instances = 2
  instances           = [
    module.Ec2_Instance_Private[0].Instance_Id,
    module.Ec2_Instance_Private[1].Instance_Id  
    ]
  tags = merge(var.vpc_tags, {
    "Name" = "Classical_Load_Balancer"
  })
   depends_on = [module.vpc, module.Ec2_Instance_Private]
}