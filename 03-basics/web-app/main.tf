#############################################################
# Terraform Remote Backend (S3 + DynamoDB)
#############################################################

terraform {
  backend "s3" {
    bucket         = "joban-terraform-devops-automation-state"
    key            = "03-basics/web-app/terraform.tfstate"
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
  region = var.region
}

#############################################################
# Data Sources – Default VPC & Subnets
#############################################################

data "aws_vpc" "default" {
  default = true
}

data "aws_subnet_ids" "default" {
  vpc_id = data.aws_vpc.default.id
}

#############################################################
# Security Groups
#############################################################

resource "aws_security_group" "instances" {
  name   = "web-app-instance-sg"
  vpc_id = data.aws_vpc.default.id
}

resource "aws_security_group_rule" "instance_http" {
  type              = "ingress"
  security_group_id = aws_security_group.instances.id
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group" "alb" {
  name   = "web-app-alb-sg"
  vpc_id = data.aws_vpc.default.id
}

resource "aws_security_group_rule" "alb_inbound" {
  type              = "ingress"
  security_group_id = aws_security_group.alb.id
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "alb_all_outbound" {
  type              = "egress"
  security_group_id = aws_security_group.alb.id
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

#############################################################
# EC2 Instances – Simple HTTP Servers
#############################################################

resource "aws_instance" "instance_1" {
  ami           = var.ami_id
  instance_type = "t2.micro"

  subnet_id       = data.aws_subnet_ids.default.ids[0]
  security_groups = [aws_security_group.instances.id]

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World 1" > index.html
              python3 -m http.server 8080 &
              EOF

  tags = {
    Name = "web-app-instance-1"
  }
}

resource "aws_instance" "instance_2" {
  ami           = var.ami_id
  instance_type = "t2.micro"

  subnet_id       = data.aws_subnet_ids.default.ids[1]
  security_groups = [aws_security_group.instances.id]

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World 2" > index.html
              python3 -m http.server 8080 &
              EOF

  tags = {
    Name = "web-app-instance-2"
  }
}

#############################################################
# Application Load Balancer
#############################################################

resource "aws_lb" "alb" {
  name               = "joban-web-app-alb"
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb.id]
  subnets            = data.aws_subnet_ids.default.ids
}

resource "aws_lb_target_group" "tg" {
  name     = "joban-webapp-tg"
  port     = 8080
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.default.id
}

resource "aws_lb_target_group_attachment" "instance_1" {
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = aws_instance.instance_1.id
  port             = 8080
}

resource "aws_lb_target_group_attachment" "instance_2" {
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = aws_instance.instance_2.id
  port             = 8080
}

resource "aws_lb_listener" "listener_http" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}
