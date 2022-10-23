
# vpc variables
instance_tenancy   = "default"
cidr_block_for_vpc = "10.0.0.0/16"

# Public Subnet
Public_Subnet = {
  "ap-south-1a" = {
    availability_zone = "ap-south-1a"
    cidr_block        = "10.0.101.0/24"
  }
  "ap-south-1b" = {
    availability_zone = "ap-south-1b"
    cidr_block        = "10.0.102.0/24"
  }
}

# Private Subnet
Private_Subnet = {
  "ap-south-1a" = {
    availability_zone = "ap-south-1a"
    cidr_block        = "10.0.1.0/24"
  }
  "ap-south-1b" = {
    availability_zone = "ap-south-1b"
    cidr_block        = "10.0.2.0/24"
  }
}

# Database Subnet
Database_Subnet = {
  "ap-south-1a" = {
    availability_zone = "ap-south-1a"
    cidr_block        = "10.0.151.0/24"
  }
  "ap-south-1b" = {
    availability_zone = "ap-south-1b"
    cidr_block        = "10.0.152.0/24"
  }
}