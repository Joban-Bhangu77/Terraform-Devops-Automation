# 03 – Terraform Basics (Backend + Simple Web App)

This module introduces:

- Terraform state fundamentals
- Local vs. remote state
- Creating an AWS-based remote backend (S3 + DynamoDB)
- Deploying a basic web application architecture

## Structure

- `aws-backend/`
  - Bootstraps S3 bucket and DynamoDB table for remote state
- `web-app/`
  - Uses the remote backend to deploy:
    - Two EC2 instances
    - Security groups
    - Application Load Balancer (ALB)

## Usage

1. **Bootstrap the backend** (run once):

   ```bash
   cd 03-basics/aws-backend
   terraform init
   terraform apply
   ```

2. **Deploy the web app**:

   ```bash
   cd ../web-app
   terraform init
   terraform plan
   terraform apply
   ```

3. Terraform will output the ALB DNS name.  
   Open it in a browser – you should see responses from instance 1 and instance 2.

To destroy resources:

```bash
terraform destroy
```
