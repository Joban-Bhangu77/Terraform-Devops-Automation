# 04 – Variables and Outputs

This module focuses on making Terraform configurations more flexible and reusable using variables and outputs.

## Concepts Practiced

- Input variables with types, defaults, and descriptions
- Sensitive variables (e.g., passwords)
- Output values for important resource attributes
- Using variables to parametrize instance counts, names, and tags

## Example

The configuration in this folder:

- Creates N EC2 instances using a variable
- Uses a map variable for tags
- Exposes outputs for the instance IDs and public IPs
