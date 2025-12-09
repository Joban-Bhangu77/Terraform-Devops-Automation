#############################################################
# Bootstrap Remote Backend (LOCAL STATE HERE)
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
  region = "us-east-1"
}

#############################################################
# S3 BUCKET FOR TERRAFORM STATE
#############################################################

resource "aws_s3_bucket" "tf_state" {
  bucket        = "joban-terraform-devops-automation-state"
  force_destroy = true
}

resource "aws_s3_bucket_versioning" "tf_state_versioning" {
  bucket = aws_s3_bucket.tf_state.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "tf_state_encryption" {
  bucket = aws_s3_bucket.tf_state.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

#############################################################
# DYNAMODB TABLE FOR STATE LOCKING
#############################################################

resource "aws_dynamodb_table" "tf_locks" {
  name         = "joban-terraform-devops-automation-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
