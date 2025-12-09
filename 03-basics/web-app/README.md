# 03.2 – Simple Web App Using Remote Backend

This folder deploys a very simple web application:

- Two EC2 instances running Python HTTP servers on port 8080
- Application Load Balancer (ALB) on port 80
- Security groups for ALB and instances

It uses the remote backend created in `../aws-backend`.

## Usage

```bash
terraform init
terraform plan
terraform apply
```

Then check the `alb_dns_name` output and open it in a browser.
