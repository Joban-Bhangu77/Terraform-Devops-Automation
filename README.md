# Terraform-DevOps-Automation

This repository is my personal, hands-on implementation of a complete **Terraform + AWS Infrastructure as Code (IaC)** learning journey, inspired by the *DevOps Directive – Terraform Beginner to Pro* course.

Instead of using the instructor's Terraform Cloud organization or AWS accounts, all infrastructure in this repository is deployed using **my own AWS environment** with:

- A custom S3 + DynamoDB remote backend  
- My own resource naming conventions  
- Production-style project structure  
- CI/CD automation workflows  

The goal is to build a **professional-grade Terraform repository** demonstrating real DevOps, Cloud Engineering, and IaC expertise.

---

## 01 - Evolution of Cloud + Infrastructure as Code

High-level theory of cloud evolution, virtualization, cloud-native platforms, and why Infrastructure as Code (IaC) like Terraform is needed.  
This module contains concept explanations only, **no Terraform code**.

---

## 02 - Overview + Setup

Introduces Terraform basics:

- Installing Terraform  
- Setting up AWS CLI  
- Authenticating with an IAM user  
- Understanding providers and the Terraform workflow  
- Deploying the first “Hello World” EC2 instance  

Includes a minimal Terraform configuration to provision a single EC2 instance in AWS.

---

## 03 - Basics

Covers:

- Terraform state and why it matters  
- Local vs. remote backends  
- Creating an AWS backend using:
  - **S3** for state storage  
  - **DynamoDB** for state locking  

Also includes a simple web application architecture:

- Two EC2 instances running basic HTTP servers  
- Security Groups  
- Application Load Balancer (ALB)  

This serves as the foundation for later modules.

---

## 04 - Variables and Outputs

Refactors Terraform configurations to use:

- Input variables (`variables.tf`)  
- Outputs (`outputs.tf`)  
- Type constraints, defaults, and sensitive values  

This makes infrastructure flexible, reusable, and easier to manage across environments.

---

## 05 - Language Features

Explores key HCL language constructs:

- `count`  
- `for_each`  
- `locals`  
- `dynamic` blocks  
- Conditionals and functions  

These features allow writing expressive, DRY (Don't Repeat Yourself) Terraform code.

---

## 06 - Organization and Modules

Demonstrates how to:

- Create reusable Terraform modules  
- Separate root modules from child modules  
- Pass variables and outputs between modules  
- Organize larger projects for teams  

This is where the repository starts to look like a real production IaC codebase.

---

## 07 - Managing Multiple Environments

Shows strategies for handling dev/staging/production:

- Environment-specific directories  
- Environment-specific backends  
- Shared global resources  
- Preventing configuration drift between environments  

---

## 08 - Testing

Introduces testing and validation practices:

- `terraform fmt` and `terraform validate`  
- Simple shell-based checks  
- A starter Terratest (Go) test file  

---

## 09 - Developer Workflows + CI/CD

Connects Terraform with developer workflows:

- GitHub Actions Terraform pipeline  
- Running fmt/validate/plan in CI  
- PR-based review workflows  

---

## 🏗 Remote Backend Architecture (AWS)

All significant modules use a centralized remote backend:

- **S3 Bucket (state)**: `joban-terraform-devops-automation-state`  
- **DynamoDB Table (lock tracking)**: `joban-terraform-devops-automation-locks`  
- **Region**: `us-east-1`  

Example S3 keys:

- `03-basics/web-app/terraform.tfstate`  
- `07-managing-multiple-environments/dev/terraform.tfstate`  

---

## 🧪 How to Use This Repository

1. Clone the repo  

   ```bash
   git clone https://github.com/<your-username>/Terraform-DevOps-Automation.git
   cd Terraform-DevOps-Automation
   ```

2. Configure AWS credentials  

   ```bash
   aws configure
   ```

3. Navigate into a module folder, for example:

   ```bash
   cd 02-overview-setup
   terraform init
   terraform plan
   terraform apply
   ```

4. For modules using the remote backend (such as `03-basics/web-app`), ensure the backend is initialized via `03-basics/aws-backend` first.

This repository grows as more modules are implemented, forming a complete Terraform IaC case study.
