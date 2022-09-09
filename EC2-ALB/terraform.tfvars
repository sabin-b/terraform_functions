# region
region = "ap-south-1"





## ec2 instance

# instance type
instance_type = "t2.micro"

# availablity zone
availability_zone = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]

# key_name
key_name = "myterrakey"

#tags
tags = {
  "Name" = "sabin"
  "env"  = "dev"
}

# security-group
ec2-security-group = {
  "80" = {
    cidr_blocks = ["0.0.0.0/0"]
    description = "port for 80"
    port        = 80
    protocol    = "tcp"
  }
  "22" = {
    cidr_blocks = ["0.0.0.0/0"]
    description = "port for 22"
    port        = 22
    protocol    = "tcp"
  }
}

# vpc_id
vpc_id = "vpc-0268c9db0a9102b63"


########## application load balancer values

 # load_balancer_Name
 load-balancer-Name = "myapp"

 # environment
Environment = [ "Dev", "Prod","Stage" ]

# subnets
subnets = ["subnet-0ccc9f5ebb4c3fba6","subnet-0654a62806f6807b5","subnet-09da2254ef977e149"]

# alb_tags
alb_tags = {
  "Owner" = "sabin"
  "Application" = "myapps"
  "shopping" = "shopify"
}

