output "instance_ids" {
  description = "IDs of all created instances"
  value       = aws_instance.example[*].id
}

output "public_ips" {
  description = "Public IPs of all created instances"
  value       = aws_instance.example[*].public_ip
}
