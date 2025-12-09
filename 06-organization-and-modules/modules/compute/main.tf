variable "subnet_id" {
  description = "Subnet ID to place instances in"
  type        = string
}

variable "instance_count" {
  description = "Number of instances to create"
  type        = number
  default     = 1
}

resource "aws_instance" "this" {
  count         = var.instance_count
  ami           = "ami-011899242bb902164"
  instance_type = "t3.micro"
  subnet_id     = var.subnet_id

  tags = {
    Name = "modules-instance-${count.index + 1}"
  }
}

output "instance_ids" {
  value = aws_instance.this[*].id
}
