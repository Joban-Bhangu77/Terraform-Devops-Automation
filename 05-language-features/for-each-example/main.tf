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

variable "instance_names" {
  description = "Map of instance names to instance types"
  type        = map(string)
  default = {
    "app-1" = "t3.micro"
    "app-2" = "t3.micro"
    "app-3" = "t3.small"
  }
}

resource "aws_instance" "foreach_example" {
  for_each      = var.instance_names
  ami           = "ami-011899242bb902164"
  instance_type = each.value

  tags = {
    Name = each.key
  }
}
