output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.this.id
}

output "public_subnet_ids" {
  description = "Public subnet IDs"
  value       = aws_subnet.public[*].id
}

output "presentation_subnet_ids" {
  description = "Presentation subnet IDs"
  value       = aws_subnet.presentation[*].id
}

output "private_subnet_ids" {
  description = "Private subnet IDs (data layer)"
  value       = aws_subnet.data[*].id
}
