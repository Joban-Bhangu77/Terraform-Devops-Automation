# 09 – Developer Workflows + CI/CD

This module integrates Terraform with GitHub Actions to provide:

- Automatic `terraform fmt` and `terraform validate` on every push/PR
- Optional `terraform plan` runs on pull requests
- A foundation for adding secure `apply` stages later

The workflow currently targets the `03-basics/web-app` configuration as an example.
