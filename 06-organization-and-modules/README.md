# 06 – Organization and Modules

This module demonstrates how to structure Terraform code using reusable modules.

## Structure

- `modules/network/` – VPC and subnets
- `modules/compute/` – EC2 instances
- `main.tf` – Root module wiring everything together

The goal is to show how modules encapsulate complexity and make projects easier to scale.
