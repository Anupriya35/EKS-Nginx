resource "aws_vpc" "main" {
  # CIDR block for the VPC.
  cidr_block       = "192.168.0.0/16"
  instance_tenancy = "default"

  # Required for EKS. Enable DNS support /hostnames in the VPC.
  enable_dns_support   = true
  enable_dns_hostnames = true

  # disable ClassicLink for the VPC.
  enable_classiclink = false
  # Enable/disable ClassicLink DNS Support for the VPC.
  enable_classiclink_dns_support = false
  # Requests an Amazon-provided IPv6 CIDR block with a /56 prefix length for the VPC.
  assign_generated_ipv6_cidr_block = false
  # A map of tags to assign to the resource.
  tags = {
    Name = "main"
  }
}
output "vpc_id" {
  value       = aws_vpc.main.id
  description = "VPC id."
  # Setting an output value as sensitive prevents Terraform from showing its value in plan and apply.
  sensitive = false
}