#############################################################
# Terraform & AWS Provider (LOCAL STATE)
#############################################################

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = var.region
}

#############################################################
# Simple Hello-World EC2 Instance
#############################################################

resource "aws_instance" "hello_world" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "tf-hello-world"
  }
}
