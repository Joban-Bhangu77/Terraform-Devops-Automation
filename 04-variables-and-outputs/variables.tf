variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "ami_id" {
  description = "AMI ID to use"
  type        = string
  default     = "ami-011899242bb902164"
}

variable "instance_type" {
  description = "Instance type to use"
  type        = string
  default     = "t3.micro"
}

variable "instance_count" {
  description = "Number of instances to create"
  type        = number
  default     = 2
}

variable "default_tags" {
  description = "Default tags to apply to all resources"
  type        = map(string)
  default = {
    Project = "Terraform-DevOps-Automation"
    Module  = "04-variables-and-outputs"
  }
}
