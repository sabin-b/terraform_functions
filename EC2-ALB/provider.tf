terraform {
  required_version = "~>1.2"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
    null = {
      source  = "hashicorp/null"
      version = "~> 3.0.0"
    }
    time = {
      source  = "hashicorp/time"
      version = "~> 0.6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.region
}
