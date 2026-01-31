#######################################
# Terraform Settings
#######################################

terraform {
  required_version = ">= 1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

#######################################
# Providers
#######################################

provider "aws" {
  region = "eu-west-1"
}

module "vpc" {
  source = "../modules/vpc"

  region   = "eu-west-1"
  vpc_cidr = "10.0.0.0/16"

  public_subnets = [
    "10.0.1.0/24",
    "10.0.2.0/24"
  ]

  presentation_subnets = [
    "10.0.11.0/24",
    "10.0.12.0/24"
  ]

  data_subnets = [
    "10.0.21.0/24",
    "10.0.22.0/24"
  ]
}


#######################################
# EKS Module
#######################################

module "eks" {
  source = "../modules/eks"

  cluster_name       = "devops-final-eks"
  region             = "eu-west-1"

  vpc_id             = module.vpc.vpc_id
  subnet_ids         = module.vpc.public_subnet_ids
  private_subnet_ids = module.vpc.private_subnet_ids
}
