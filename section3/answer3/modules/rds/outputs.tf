# This is the endpoint of the NestJS database instance
output "nestjs_db_endpoint" {
  value = aws_db_instance.db_instance["nestjs"].endpoint
}

# This is the endpoint of the springboot database instance
output "springboot_db_endpoint" {
  value = aws_db_instance.db_instance["springboot"].endpoint
}
