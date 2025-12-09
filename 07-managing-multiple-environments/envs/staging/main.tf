terraform {
  backend "s3" {
    bucket         = "joban-terraform-devops-automation-state"
    key            = "07-managing-multiple-environments/staging/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "joban-terraform-devops-automation-locks"
    encrypt        = true
  }

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

resource "aws_s3_bucket" "example" {
  bucket        = "joban-terraform-demo-staging-bucket"
  force_destroy = true

  tags = {
    Environment = "STAGING"
    Module      = "07-managing-multiple-environments"
  }
}
