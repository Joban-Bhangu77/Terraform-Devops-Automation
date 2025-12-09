variable "region" {
  description = "AWS region for the web app"
  type        = string
  default     = "us-east-1"
}

variable "ami_id" {
  description = "AMI ID for EC2 instances"
  type        = string
  default     = "ami-011899242bb902164"
}
