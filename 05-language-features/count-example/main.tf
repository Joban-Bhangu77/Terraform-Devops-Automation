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

variable "instance_count" {
  description = "How many instances to create"
  type        = number
  default     = 3
}

resource "aws_instance" "count_example" {
  count         = var.instance_count
  ami           = "ami-011899242bb902164"
  instance_type = "t3.micro"

  tags = {
    Name = "count-example-${count.index}"
  }
}
