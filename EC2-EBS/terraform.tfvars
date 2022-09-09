region            = "ap-south-1"
key_name          = "myterrakey"
availability_zone = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
instance_type     = ["t2.micro", "t2.small", "t2.large"]
package_name      = "httpd"
ec2-security-group = {
  "80" = {
    cidr_blocks = ["0.0.0.0/0"]
    description = "allow port 80"
    port        = 80
    protocol    = "tcp"
  }
  "22" = {
    cidr_blocks = ["0.0.0.0/0"]
    description = "allow port 80"
    port        = 80
    protocol    = "tcp"
  }
  "443" = {
    cidr_blocks = ["0.0.0.0/0"]
    description = "allow port 80"
    port        = 80
    protocol    = "tcp"
  }
}
environment             = ["Dev", "Prod", "Stag"]
ec2-security-group-name = "EC2-security-group"
vpc_id                  = "vpc-0268c9db0a9102b63"
ec2-tags = {
  "Name"       = "Myapp"
  "project"    = "health insurance"
  "project-id" = "0012"
}
security-group-tags = {
  "attach" = "Myapp instance"
  "ports"  = "80,443,22"
}
instance-volumes = {
  "/dev/sdd" = "1"
  "/dev/sde" = "2"
  "/dev/sdf" = "3"
}