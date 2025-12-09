# 02 – Terraform Overview & Setup

This module sets up the tools and deploys a first simple resource to confirm everything is working.

## What this module covers

- Installing Terraform
- Configuring the AWS CLI
- Creating a non-root IAM user for Terraform
- Defining the AWS provider in Terraform
- Deploying a single EC2 instance

## Files

- `main.tf` – Terraform configuration to deploy one EC2 instance
- `variables.tf` – input variables (region, AMI, instance type)
- `outputs.tf` – output values (instance ID, public IP)

## Usage

```bash
cd 02-overview-setup
terraform init
terraform plan
terraform apply
```

Then check the AWS console → EC2 to see the instance.

To clean up:

```bash
terraform destroy
```
