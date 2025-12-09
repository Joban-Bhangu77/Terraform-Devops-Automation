terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

module "network" {
  source = "./modules/network"
}

module "compute" {
  source         = "./modules/compute"
  subnet_id      = module.network.public_subnet_id
  instance_count = 2
}

output "public_subnet_id" {
  value = module.network.public_subnet_id
}

output "instance_ids" {
  value = module.compute.instance_ids
}
