output "alb_dns_name" {
  description = "Public DNS name of the load balancer"
  value       = aws_lb.alb.dns_name
}

output "instance_ids" {
  description = "IDs of the EC2 instances"
  value       = [
    aws_instance.instance_1.id,
    aws_instance.instance_2.id
  ]
}
